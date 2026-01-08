with
gospodarze as (
    select distinct
        gospodarz as `druzyna/zawodnik`
    from
        {{ ref('core_zdarzenia') }}
),

goscie as (
    select distinct
        gosc as `druzyna/zawodnik`
    from
        {{ ref('core_zdarzenia') }}
),

druzyny_zawodnicy as (
    select * from gospodarze
    union
    select * from goscie
),

final as (
    select
        abs(xxhash64(`druzyna/zawodnik`)) as id_druzyny_zawodnika,
        `druzyna/zawodnik`
    from
        druzyny_zawodnicy
)

select * from final