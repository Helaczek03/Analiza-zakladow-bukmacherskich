{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'id_zdarzenia',

    merge_update_columns = [
      'id_kuponu',
      'mecz',
      'nazwa_rozgrywek',
      'dyscyplina',
      'rodzaj_zakladu',
      'co_obstawiono',
      'kurs_zdarzenia',
      'czy_wygrane_zdarzenie'
    ]
  )
}}

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
        case sport_name
            when 'Darts' then 'Dart'
            when 'League of Legends' then 'Esport'
            when '2022 FIFA World Cup' then 'Piłka Nożna'
            else sport_name
        end as dyscyplina,
        market as rodzaj_zakladu,
        typ as co_obstawiono,
        cast(replace(odds_value_bet, ',', '.') as numeric(10,2)) as kurs_zdarzenia,
        case odds_is_winning
            when 1 then 'tak'
            when 0 then 'nie'
            else 'anulowane'
        end as czy_wygrane_zdarzenie,
        current_timestamp() as data_zaladowania
    from
        source
    where 1=1
    and try_cast(ticket_number as bigint) is not null
    and opportunity is not null
)

select * from final