with

source as (
    select 
        data_i_godzina_zagrania,
        date(data_i_godzina_zagrania) as data,
        status_kuponu 
    from 
        {{ ref('stg_kupony') }}
    where status_kuponu != 'zwrot'
),

wiele_kuponow as (
    select 
        date(data_i_godzina_zagrania) as data
    from
        {{ ref('stg_kupony') }}
    where
        status_kuponu != 'zwrot'
    group by 
        date(data_i_godzina_zagrania)
    having 
        count(1) > 1
),

ordered as (
    select
        s.data_i_godzina_zagrania,
        s.data,
        case s.status_kuponu
            when 'wygrany' then 'w'
            when 'przegrany' then 'p'
        end as status_kuponu
    from
        source s 
    join
        wiele_kuponow wk
    using
        (data)
    order by s.data_i_godzina_zagrania
),

final as (
    select
        data,
        count(1) as liczba_kuponow,
        concat_ws('', collect_list(status_kuponu)) as kolejnosc_kuponow
    from ordered
    group by data
    order by liczba_kuponow
)

select * from final

-- co mozna z tego zobaczyc
-- czy np pierwszy wygrany badz przegrany kupon wplywa na wygrywanie badz przegrywanie danego dnia (emocje)