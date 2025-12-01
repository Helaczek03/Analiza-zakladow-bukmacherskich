with
source_1 as (
    select * from {{ ref('stg_kupony') }}
),

source_2 as (
    select * from {{ ref('core_statusy_kuponow') }}
),

source_3 as (
    select * from {{ ref('core_kiedy_zagrano_kupony') }}
),

final as(
    select
        id_kuponu,
        data_i_godzina_zagrania,
        stawka,
        wygrana,
        kurs_kuponu,
        s2.id as id_statusu_kuponu,
        s3.id as id_kiedy_zagrano
    from source_1 s1
    join source_2 s2
    using (status_kuponu)
    join source_3 s3
    using (kiedy_zagrano)
)

select * from final