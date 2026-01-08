with
source as (
    select distinct
        status_kuponu
    from
        {{ ref('stg_kupony') }}
),

final as (
    select
        abs(xxhash64(status_kuponu)) as id,
        status_kuponu
    from
        source
)

select * from final