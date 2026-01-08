with
source as (
    select distinct
        co_obstawiono
    from
        {{ ref('core_zdarzenia') }}
),

final as (
    select
        abs(xxhash64(co_obstawiono)) as id_co_obstawiono,
        co_obstawiono
    from
        source
)

select * from final