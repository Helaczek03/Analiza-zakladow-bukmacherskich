with
source as (
    select
        id_zdarzenia,
        nazwa_rozgrywek,
        dyscyplina,
        status_zdarzenia
    from
        {{ ref('core_zdarzenia') }}
),

rozgrywki as (
    select * from {{ ref('dim_rozgrywki') }}
),

dyscypliny as (
    select * from {{ ref('dim_dyscypliny') }}
),

statusy as (
    select * from {{ ref('dim_statusy_zdarzen') }}
    where status_zdarzenia != 'anulowane'
),

final as (
    select
        s.id_zdarzenia,
        r.id_nazwy_rozgrywek,
        d.id_dyscpliny,
        st.id_statusu_zdarzenia
    from
        source s
    join
        rozgrywki r
    on s.nazwa_rozgrywek = r.nazwa_rozgrywek
    join
        dyscypliny d
    on s.dyscyplina = d.dyscyplina
    join
        statusy st
    on s.status_zdarzenia = st.status_zdarzenia
)

select * from final

-- co mozna z tego zobaczyc
-- procent wszystkich wygranych zdarzen (ogolnie i z podzialem na rozgrywki lub dyscypliny)