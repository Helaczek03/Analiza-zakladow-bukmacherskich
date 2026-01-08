with
source as (
    select distinct
        dyscyplina
    from
        {{ ref('core_zdarzenia') }}
),

final as (
    select
        abs(xxhash64(dyscyplina)) as id_dyscpliny,
        dyscyplina
    from
        source
)

select * from final