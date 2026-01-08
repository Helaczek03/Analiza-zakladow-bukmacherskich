with
gospodarze as (
    select distinct 
        trim(get(split(mecz, ' - '), 0)) AS druzyna_zawodnik,
        dyscyplina,
        data_zaladowania
    from 
        {{ ref('core_int_zdarzenia') }}
    where 
        dyscyplina not in ('Zakłady Specjalne', 'Sporty Wirtualne', 'Inne', 'BetGames')
),

goscie as (
    select distinct 
        trim(get(split(mecz, ' - '), 1)) AS druzyna_zawodnik,
        dyscyplina,
        data_zaladowania
    from 
        {{ ref('core_int_zdarzenia') }}
    where 
        dyscyplina not in ('Zakłady Specjalne', 'Sporty Wirtualne', 'Inne', 'BetGames')        
),

unioned as (
    select * from gospodarze
    union
    select * from goscie
),

unioned_max_date as (
    select
        druzyna_zawodnik,
        dyscyplina,
        min(data_zaladowania) as data_zaladowania
    from unioned
    group by druzyna_zawodnik, dyscyplina
),

final as (
    select
        row_number() over (order by druzyna_zawodnik) as id,
        case
            when size(filter(split(druzyna_zawodnik, '[ -,]+'), w -> length(w) >= 4)) > 0
                then element_at(filter(split(druzyna_zawodnik, '[ -,]+'), w -> length(w) >= 4), 1)
            else druzyna_zawodnik
        end as pierwsze_dluzsze_slowo,
        *
    from
        unioned_max_date
)

select * from final

-- zrobic nowa tabele w ktorej bedzie nazwa i wspolna nazwa dla danej druzyny
-- i dyscypliny oraz status (potwierdzony, niepotwierdzony)
-- wspolna czesc w nazwie -> najdluzsza nazwa druzyny sposrod kandydatow
-- jesli dana druzyna ma tylko 1 nazwe to mozna ja dac jako potwierdzona ?
-- na koncu sprawdzenie niepotwierdzonych statusow