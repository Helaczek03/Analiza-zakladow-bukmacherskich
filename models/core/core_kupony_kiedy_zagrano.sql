with
source as (
    select distinct kiedy_zagrano from {{ ref('stg_kupony') }}
),

final as(
    select
        row_number() over (order by kiedy_zagrano) as id,
        kiedy_zagrano
    from
        source
)

select * from final