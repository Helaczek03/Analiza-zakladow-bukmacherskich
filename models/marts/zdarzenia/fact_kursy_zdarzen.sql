with
source as (
    select * from {{ ref('core_zdarzenia') }}
),

wygrane_przegrane as (
    select 
        kurs_zdarzenia,
        count(1) as liczba_zdarzen,
        sum(case when status_zdarzenia = 'wygrane' then 1 else 0 end) as wygrane,
        sum(case when status_zdarzenia = 'przegrane' then 1 else 0 end) as przegrane
    from 
        source
    where 
        status_zdarzenia != 'anulowane'
    group by 
        kurs_zdarzenia
    order by 
        liczba_zdarzen desc

),

final as (
    select
        kurs_zdarzenia,
        round(1 / kurs_zdarzenia, 2) as prawdopodobienstwo_wygranej,
        liczba_zdarzen,
        wygrane,
        przegrane,
        round(wygrane / liczba_zdarzen, 2) procent_wygranych
    from
        wygrane_przegrane 
)

select * from final

-- co moge z tego zobaczyc
-- kurs ktory wyraznie daje wiekszy procent wygranej niz mowi o tym prawodopodobienstwo (i na odwrot)