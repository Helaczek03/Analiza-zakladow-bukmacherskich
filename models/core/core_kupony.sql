with
source as (
    select * from {{ ref('stg_kupony') }}
)

select * from source