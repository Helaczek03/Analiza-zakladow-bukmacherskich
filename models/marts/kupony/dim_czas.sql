with data_i_godzina as (
    select
        explode(
            sequence(
                timestamp('2020-01-01 00:00:00'),
                timestamp('2030-12-31 23:00:00'),
                interval 1 hour
            )
        ) as czas
),

final as (
    select
        czas as data_godzina,
        year(czas) as rok,
        quarter(czas) as kwartal,
        month(czas) as miesiac,
        dayofyear(czas) as dzien_roku,
        day(czas) as dzien_miesiaca,
        ((dayofweek(czas) + 5) % 7) + 1 as dzien_tygodnia, -- 1=pon, 7=niedz
        hour(czas) as godzina,
        case
            when ((dayofweek(czas) + 5) % 7) + 1 in (6, 7) then 'tak'
            else 'nie'
        end as czy_weekend
    from 
        data_i_godzina
)

select * from final