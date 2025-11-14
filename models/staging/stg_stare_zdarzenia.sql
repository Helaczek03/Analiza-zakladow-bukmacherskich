with
source as (
    select * from {{ source('inzynierka', 'stare_zdarzenia') }}
),

final as (
    select
        try_cast(ticket_number as bigint) as id_kuponu,
        cast(replace(odds_value_bet, ',', '.') as numeric(10,2))as kurs,
        opportunity as mecz,
        market as rodzaj_zakladu,
        sport_name as dyscyplina,
        league_name as nazwa_rozgrywek,
        typ as co_obstawiono,
        cast(odds_is_winning as int) as czy_wygrane_zdarzenie
    from
        source
    where try_cast(ticket_number as bigint) is not null
    and odds_is_winning is not null
    and opportunity is not null
)

select * from final