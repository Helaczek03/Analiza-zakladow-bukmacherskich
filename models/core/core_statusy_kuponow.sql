with
source as (
    select distinct status_kuponu from {{ ref('stg_kupony') }}
),

final as(
    select
        row_number() over (order by status_kuponu) as id,
        status_kuponu
    from
        source
)

select * from final