with
source_1 as (
    select * from {{ ref('core_int_zdarzenia') }}
    where dyscyplina not in ('Zakłady Specjalne', 'Sporty Wirtualne', 'Inne', 'BetGames')
),

source_2 as (
    select * from {{ ref('core_zdarzenia_mecze') }}
),

source_3 as (
    select * from {{ ref('core_co_obstawiono_slownik') }}
),

final as (
    select
        s1.id_zdarzenia,
        s1.id_kuponu,
        s2.ujednolicony_mecz as mecz,
        s2.gospodarz,
        s2.gosc,
        s1.nazwa_rozgrywek,
        s1.dyscyplina,
        s3.ujednolicony_rodzaj_zakladu as rodzaj_zakladu,
        s3.ujednolicone_co_obstawiono as co_obstawiono,
        s1.kurs_zdarzenia,
        case s1.czy_wygrane_zdarzenie
            when 'tak' then 'wygrane'
            when 'nie' then 'przegrane'
            else s1.czy_wygrane_zdarzenie
        end as status_zdarzenia,
        s1.data_zaladowania
    from
        source_1 s1
    join
        source_2 s2
    on s1.mecz = s2.mecz
    join
        source_3 s3
    on s1.rodzaj_zakladu = s3.rodzaj_zakladu
    and s1.co_obstawiono = s3.co_obstawiono
)

select * from final