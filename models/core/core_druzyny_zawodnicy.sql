with
gospodarze as (
    select distinct 
        trim(get(split(mecz, ' - '), 0)) AS `druzyny/zawodnicy`,
        dyscyplina
    from 
        {{ ref('core_int_zdarzenia') }}
    where 
        dyscyplina not in ('Sporty Wirtualne', 'Inne', 'BetGames')
),

goscie as (
    select distinct 
        trim(get(split(mecz, ' - '), 1)) AS `druzyny/zawodnicy`,
        dyscyplina
    from 
        {{ ref('core_int_zdarzenia') }}
    where 
        dyscyplina not in ('Sporty Wirtualne', 'Inne', 'BetGames')        
),

unioned as (
    select * from gospodarze
    union
    select * from goscie
),

final as (
    select
        row_number() over (order by `druzyny/zawodnicy`) as id,
        *
    from
        unioned
)

select * from final