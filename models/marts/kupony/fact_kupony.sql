with
source_1 as (
    select * from {{ ref('stg_kupony') }}
),

source_2 as (
    select * from {{ ref('dim_statusy_kuponow') }}
    where status_kuponu != 'zwrot'
),

source_3 as (
    select * from {{ ref('dim_kiedy_zagrano') }}
),

final as (
    select
        s1.id_kuponu,
        s1.data_i_godzina_zagrania,
        date_trunc('hour', s1.data_i_godzina_zagrania) as zaokraglona_data_i_godzina,
        s1.postawiona_kwota,
        s1.wygrana_kwota,
        s1.kurs_kuponu,
        s2.id as id_statusu_kuponu,
        s3.id as id_kiedy_zagrano
    from
        source_1 s1
    join
        source_2 s2
    on s1.status_kuponu = s2.status_kuponu
    join
        source_3 s3
    on s1.kiedy_zagrano = s3.kiedy_zagrano
)

select * from final

-- co mozna z tego zobaczyc
-- procent wygranych kuponow calosciowy,
-- bilans wygranych i przegranych kuponow (kwota calosciowa i z podzialem na lata, kwartaly, miesiace),
-- sprawdzenie czy dzien tygodnia (weekend lub nie), godzina stawiania ma wplyw na procent wygranych kuponow,
-- procent wygranych z podzialem na to kiedy stawiano (przed meczem, na zywo)