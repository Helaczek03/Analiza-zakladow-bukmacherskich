with
source as (
    select * from {{ source('inzynierka', 'stare_zdarzenia') }}
),

final as (
    select
        concat(ticket_number, '_', row_number() over (partition by ticket_number order by ticket_number)) as id_zdarzenia,
        try_cast(ticket_number as bigint) as id_kuponu,
        opportunity as mecz,
        league_name as nazwa_rozgrywek,
        sport_name as dyscyplina,
        market as rodzaj_zakladu,
        cast(replace(odds_value_bet, ',', '.') as numeric(10,2)) as kurs_zdarzenia,
        typ as co_obstawiono,
        case odds_is_winning
            when 1 then 'tak'
            when 0 then 'nie'
            else 'anulowane'
        end as czy_wygrane_zdarzenie
    from
        source
    where 1=1
    and try_cast(ticket_number as bigint) is not null
    and opportunity is not null
)

select * from final