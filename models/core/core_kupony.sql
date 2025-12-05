with
source_1 as (
    select * from {{ ref('stg_kupony') }}
),

source_2 as (
    select * from {{ ref('core_kupony_kwoty') }}
),

final as (
    select
        id_kuponu,
        data_i_godzina_zagrania,
        kiedy_zagrano,
        id as id_wygranej
    from
        source_1
    join
        source_2
    using(postawiona_kwota, kurs_kuponu, status_kuponu, wygrana_kwota)
)

select * from final