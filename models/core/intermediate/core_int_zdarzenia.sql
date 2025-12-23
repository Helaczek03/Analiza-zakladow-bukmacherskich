with
source_1 as (
    select * from {{ ref('stg_stare_zdarzenia') }}
),

source_2 as (
    select * from {{ ref('stg_nowe_zdarzenia') }}
),

slownik_1 as (
    select * from {{ ref('core_stare_zdarzenia_rozgrywki') }}
),

slownik_2 as (
    select * from {{ ref('core_nowe_zdarzenia_rozgrywki') }}
),

stare_zdarzenia as (
    select
        s.id_zdarzenia,
        s.id_kuponu,
        s.mecz,
        sl.poprawna_nazwa_rozgrywek as nazwa_rozgrywek,
        s.dyscyplina,
        s.rodzaj_zakladu,
        s.co_obstawiono,
        s.kurs_zdarzenia,
        s.czy_wygrane_zdarzenie,
        s.data_zaladowania
    from source_1 s
    join slownik_1 sl
    on s.id_rozgrywek = sl.id_rozgrywek
    and s.nazwa_rozgrywek = sl.nazwa_rozgrywek
),

nowe_zdarzenia as (
    select
        s.id_zdarzenia,
        s.id_kuponu,
        s.mecz,
        sl.poprawna_nazwa_rozgrywek as nazwa_rozgrywek,
        s.dyscyplina,
        s.rodzaj_zakladu,
        s.co_obstawiono,
        s.kurs_zdarzenia,
        s.czy_wygrane_zdarzenie,
        s.data_zaladowania
    from source_2 s
    join slownik_2 sl
    on s.kraj_rozgrywek = sl.kraj_rozgrywek
    and s.nazwa_rozgrywek = sl.nazwa_rozgrywek
),

final as (
    select * from stare_zdarzenia
    union all
    select * from nowe_zdarzenia
)

select * from final