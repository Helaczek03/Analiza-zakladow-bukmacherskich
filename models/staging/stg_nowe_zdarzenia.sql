-- incremental dodaje tylko nowe dane
-- id_zdarzenia - kolumna po ktorej merge indentyfikuje czy dany rekord jest juz w tabeli
-- merge 
    -- w przypadku gdy nie ma jeszcze danego id_zdarzenia doda nowy rekord,
    -- w przypadku gdy w tabeli jest juz dane id_zdarzenia to zrobi update kolumn zawartych w merge_update_columns
-- w merge_upadate_columns nie ma data_zaladowania po to aby pozostala taka jak byla poprzednio

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'id_zdarzenia',

    merge_update_columns = [
      'id_kuponu',
      'mecz',
      'kraj_rozgrywek',
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
    select * from {{ source('inzynierka', 'nowe_zdarzenia') }}
),

final as (
    select
        odds_number as id_zdarzenia,
        number as id_kuponu,
        match_name as mecz,
        category_name as kraj_rozgrywek,
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
        end as czy_wygrane_zdarzenie,
        --TO_TIMESTAMP('2025-11-01T16:51:42+00:00') as data_zaladowania
        current_timestamp() as data_zaladowania
    from
        source
    where 1=1
    and try_cast(number as bigint) is not null
    and match_name is not null
)

select * from final