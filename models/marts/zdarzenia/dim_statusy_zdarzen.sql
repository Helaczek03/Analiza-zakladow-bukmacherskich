with
source as (
    select distinct
        status_zdarzenia
    from
        {{ ref('core_zdarzenia') }}
),

final as (
    select
        abs(xxhash64(status_zdarzenia)) as id_statusu_zdarzenia,
        status_zdarzenia
    from
        source
)

select * from final