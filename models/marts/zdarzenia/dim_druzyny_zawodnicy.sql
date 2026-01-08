with
gospodarze as (
    select distinct
        gospodarz as druzyna_zawodnik
    from
        {{ ref('core_zdarzenia') }}
),

goscie as (
    select distinct
        gosc as druzyna_zawodnik
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
        abs(xxhash64(druzyna_zawodnik)) as id_druzyny_zawodnika,
        druzyna_zawodnik
    from
        druzyny_zawodnicy
)

select * from final