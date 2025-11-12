with
source as (
    select * from {{ source('inzynierka', 'kupony') }}
),

modified_date as (
    select
        `Numer kuponu`,
        case
            when substr(`Data i godzina zagrania`, 2, 1) = '.' 
            and substr(`Data i godzina zagrania`, 4, 1) = '.' -- miesiac i dzien jednocyfrowe
                then '0' || substr(`Data i godzina zagrania`, 1, 2) || '0' || substr(`Data i godzina zagrania`, 3, 15)
            when substr(`Data i godzina zagrania`, 2, 1) = '.' -- miesiac jednocyfrowy
                then '0' || `Data i godzina zagrania`
            when substr(`Data i godzina zagrania`, 5, 1) = '.' -- dzien jednocyfrowy
                then substr(`Data i godzina zagrania`, 1, 3) || '0' || substr(`Data i godzina zagrania`, 4, 15)
            else `Data i godzina zagrania` -- miesiac i dzien dwucyfrowe
        end as new_date
    from source
),

modified_time as (
    select
        `Numer kuponu`,
        case
            when substr(new_date, -8, 1) = ' ' -- godzina jednocyfrowa
                then substr(new_date, 1, 11) || '0' || substr(new_date, 12, 7)
            else new_date
        end as final_time
    from modified_date
),


final as (
    select 
        cast(`Numer kuponu` as bigint) as id_kuponu,
        TO_TIMESTAMP(final_time, 'MM.dd.yyyy HH:mm:ss') as data_i_godzina_zagrania,
        cast(replace(stawka, ',', '.') as numeric(10, 2)) as stawka,
        cast(replace(`Wygrana (po opodatkowaniu 12%)`, ',', '.') as numeric(10,2)) as wygrana,
        cast(replace(kurs, ',', '.') as numeric(10, 2)) as kurs,
        `Status kuponu` as status_kuponu,
        `Live / Prematch` as live_czy_prematch
    from source
    join modified_time
    using (`Numer kuponu`)
)

select * from final