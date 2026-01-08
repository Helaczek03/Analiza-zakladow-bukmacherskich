with
source as (
    select 
        id_zdarzenia,
        kurs_zdarzenia,
        gospodarz,
        gosc,
        dyscyplina,
        rodzaj_zakladu,
        co_obstawiono,
        status_zdarzenia
    from 
        {{ ref('core_zdarzenia') }}
),

druzyny_zawodnicy as (
    select * from {{ ref('dim_druzyny_zawodnicy') }}
),

dyscypliny as (
    select * from {{ ref('dim_dyscypliny') }}
),

obstawienia as (
    select * from {{ ref('dim_co_obstawiono') }}
),

statusy as (
    select * from {{ ref('dim_statusy_zdarzen') }}
    where status_zdarzenia != 'anulowane'
),

final as (
    select
        s.id_zdarzenia,
        s.kurs_zdarzenia,
        case 
            when 
                o.co_obstawiono in ('Gospodarz', 'Gospodarz lub Remis')
                then dz.id_druzyny_zawodnika
            when
                o.co_obstawiono in ('Gość', 'Remis lub Gość')
                then dz2.id_druzyny_zawodnika
        end as id_obstawionej_druzyny_zawodnika,
        d.id_dyscpliny,
        o.id_co_obstawiono,
        st.id_statusu_zdarzenia
    from
        source s
    join
        druzyny_zawodnicy dz
        on s.gospodarz = dz.`druzyna/zawodnik`
    join
        druzyny_zawodnicy dz2
        on s.gosc = dz2.`druzyna/zawodnik`
    join
        dyscypliny d
        on s.dyscyplina = d.dyscyplina
    join
        obstawienia o
        on s.co_obstawiono = o.co_obstawiono
    join
        statusy st
        on s.status_zdarzenia = st.status_zdarzenia 
    where 
        d.dyscyplina in ('Piłka Nożna', 'Tenis', 'Piłka Ręczna')
    and
        s.rodzaj_zakladu in ('Mecz', 'Zwycięzca')
    and
        o.co_obstawiono in ('Gospodarz', 'Gość', 'Gospodarz lub Remis', 'Remis lub Gość')
)

select * from final

-- co mozna z tego zobaczyc
-- procent wygranych zdarzen na danej druzynie (ogolnie i w rozbiciu na gospodarza i goscia)
-- procent wygranych w zaleznosci od tego co obstawiono (ogolnie i w rozbiciu na dyscypliny)