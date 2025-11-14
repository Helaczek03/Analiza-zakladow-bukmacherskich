with
source as (
    select * from {{ source('inzynierka', 'nowe_zdarzenia') }}
),

final as (
    select
        odds_number as id_zdarzenia,
        number as id_kuponu,
        sport_name as dyscyplina,
        category_name as kraj,
        tournament_name as nazwa_rozgrywek,
        match_name as mecz,
        line_name as rodzaj_zakladu,
        cast(replace(odds, ',', '.') as numeric(10,2)) as kurs,
        zagrany_typ as co_obstawiono,
        status_twojego_zdarzenia as czy_wygrane_zdarzenie
    from
        source
)

select * from final