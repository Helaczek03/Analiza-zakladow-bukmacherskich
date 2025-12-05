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
        case sport_name
            when 'Darts' then 'Dart'
            when 'League of Legends' then 'Esport'
            when '2022 FIFA World Cup' then 'Piłka Nożna'
            else sport_name
        end as dyscyplina,
        line_name as rodzaj_zakladu,
        zagrany_typ as co_obstawiono,
        cast(replace(odds, ',', '.') as numeric(10,2)) as kurs_zdarzenia,
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