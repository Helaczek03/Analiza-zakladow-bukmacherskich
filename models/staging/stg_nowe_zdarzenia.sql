with
source as (
    select * from {{ source('inzynierka', 'nowe_zdarzenia') }}
),

final as (
    select
        odds_number as id_zdarzenia,
        number as id_kuponu,
        match_name as mecz,
        trim(split(match_name, '-')[0]) as gospodarz,
        trim(split(match_name, '-')[1]) as gosc,
        tournament_name as nazwa_rozgrywek,
        sport_name as dyscyplina,
        line_name as rodzaj_zakladu,
        cast(replace(odds, ',', '.') as numeric(10,2)) as kurs,
        zagrany_typ as co_obstawiono,
        cast(case status_twojego_zdarzenia
                when 'zwycięski' then 1
                when 'przegrany' then 0
            end
        as int) as czy_wygrane_zdarzenie
    from
        source
    where 
        status_twojego_zdarzenia in ('zwycięski', 'przegrany')
)

select * from final