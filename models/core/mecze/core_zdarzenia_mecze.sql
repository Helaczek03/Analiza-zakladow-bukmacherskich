with
source as (
    select distinct 
        mecz
    from 
        {{ ref('core_int_zdarzenia') }}
    where 
        dyscyplina not in ('Zakłady Specjalne', 'Sporty Wirtualne', 'Inne', 'BetGames')
),

slownik as (
    select * from {{ ref('core_druzyny_zawodnicy_slownik') }}
),

mecze as (
    select
        mecz,
        trim(get(split(mecz, ' - '), 0)) AS gospodarz,
        trim(get(split(mecz, ' - '), 1)) AS gosc
    from 
        source
    order by mecz
),

ujednolicone as (
    select
        m.mecz,
        s.ujednolicona_nazwa as gospodarz,
        s2.ujednolicona_nazwa as gosc,
        case
            when s.ujednolicona_nazwa is null and s2.ujednolicona_nazwa is null --gospodarz i gosc null
            then mecz
            when s.ujednolicona_nazwa is null and s2.ujednolicona_nazwa is not null --gospodarz null, gosc nie
            then s2.ujednolicona_nazwa
            when s.ujednolicona_nazwa is not null and s2.ujednolicona_nazwa is null --gospodarz nie null, gosc null
            then s.ujednolicona_nazwa
            else s.ujednolicona_nazwa || ' - ' || s2.ujednolicona_nazwa
        end as ujednolicony_mecz
    from 
        mecze m
    left join 
        slownik s
    on 
        m.gospodarz = s.druzyna_zawodnik
    left join 
        slownik s2
    on 
        m.gosc = s2.druzyna_zawodnik
    order by mecz
)

select * from ujednolicone