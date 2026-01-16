-- incremental dodaje tylko nowe dane
-- id_kuponu - kolumna po ktorej merge indentyfikuje czy dany rekord jest juz w tabeli
-- merge 
    -- w przypadku gdy nie ma jeszcze danego id_kuponu doda nowy rekord,
    -- w przypadku gdy w tabeli jest juz dane id_kuponu to zrobi update kolumn zawartych w merge_update_columns
-- w merge_upadate_columns nie ma data_zaladowania po to aby pozostala taka jak byla poprzednio

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'id_kuponu',

    merge_update_columns = [
      'data_i_godzina_zagrania',
      'postawiona_kwota',
      'wygrana_kwota',
      'kurs_kuponu',
      'status_kuponu',
      'kiedy_zagrano'
    ]
  )
}}

with
source as (
    select * from {{ source('raw', 'kupony') }}
),

modified_date as (
    select
        numer_kuponu,
        case
            when substr(data_i_godzina_zagrania, 2, 1) = '.' 
            and substr(data_i_godzina_zagrania, 4, 1) = '.' -- miesiac i dzien jednocyfrowe
                then '0' || substr(data_i_godzina_zagrania, 1, 2) || '0' || substr(data_i_godzina_zagrania, 3, 15)
            when substr(data_i_godzina_zagrania, 2, 1) = '.' -- miesiac jednocyfrowy
                then '0' || data_i_godzina_zagrania
            when substr(data_i_godzina_zagrania, 5, 1) = '.' -- dzien jednocyfrowy
                then substr(data_i_godzina_zagrania, 1, 3) || '0' || substr(data_i_godzina_zagrania, 4, 15)
            else data_i_godzina_zagrania -- miesiac i dzien dwucyfrowe
        end as new_date
    from source
),

modified_time as (
    select
        numer_kuponu,
        case
            when substr(new_date, -8, 1) = ' ' -- godzina jednocyfrowa
                then substr(new_date, 1, 11) || '0' || substr(new_date, 12, 7)
            else new_date
        end as final_time
    from modified_date
),


final as (
    select 
        cast(numer_kuponu as bigint) as id_kuponu,
        TO_TIMESTAMP(final_time, 'MM.dd.yyyy HH:mm:ss') as data_i_godzina_zagrania,
        cast(replace(stawka, ',', '.') as numeric(10, 2)) as postawiona_kwota,
        coalesce(cast(replace(wygrana_po_opodatkowaniu_12pct, ',', '.') as decimal(10,2)), 0) as wygrana_kwota,
        cast(replace(kurs, ',', '.') as numeric(10, 2)) as kurs_kuponu,
        status_kuponu,
        case `live_/_prematch`
            when 'live' then 'na żywo'
            when 'prematch' then 'przed meczem'
            else null
        end as kiedy_zagrano,
        TO_TIMESTAMP('2025-11-01T16:51:42+00:00') as data_zaladowania
        --current_timestamp() as data_zaladowania
    from source s
    join modified_time
    using (numer_kuponu)
    where try_cast (numer_kuponu as bigint) is not null 
)

select * from final