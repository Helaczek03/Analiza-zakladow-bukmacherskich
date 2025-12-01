with
source as (
    select * from {{ source('inzynierka', 'nowe_zdarzenia') }}
),

final as (
    select
        odds_number as id_zdarzenia,
        number as id_kuponu,
        match_name as mecz,
        tournament_name as nazwa_rozgrywek,
        sport_name as dyscyplina,
        line_name as rodzaj_zakladu,
        cast(replace(odds, ',', '.') as numeric(10,2)) as kurs_zdarzenia,
        zagrany_typ as co_obstawiono,
        case status_twojego_zdarzenia
            when 'zwycięski' then 'tak'
            when 'przegrany' then 'nie'
            else 'anulowane'
        end as czy_wygrane_zdarzenie
    from
        source
    where 1=1
    and try_cast(number as bigint) is not null
    and match_name is not null
)

select * from final