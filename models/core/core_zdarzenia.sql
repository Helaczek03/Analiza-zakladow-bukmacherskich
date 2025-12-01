with 
source_1 as (
    select * from {{ ref('stg_stare_zdarzenia') }}
),

source_2 as (
    select * from {{ ref('stg_nowe_zdarzenia') }}
),

final as (
    select *
    from source_1

    union all

    select *
    from source_2
)

select * from final