with
source_1 as (
    select * from {{ ref('core_druzyny_zawodnicy_wielokrotne') }}
),

source_2 as (
    select * from {{ ref('core_druzyny_zawodnicy_pojedyncze') }}
),

unioned as (
    select * from source_1
    union
    select * from source_2
),

final as (
    select
        druzyna_zawodnik,
        case druzyna_zawodnik
            when 'AGO ROGUE' then 'Rogue'
            when 'Fenix Toulouse Handball' then 'Toulouse'
            when 'Puławy' then 'KS Azoty Puławy'
            when 'Opole' then 'KPR Gwardia Opole'
            when 'Vitoria SC Guimaraes' then 'Vitoria Guimaraes'
            when 'Warta' then 'Warta Poznań'
            when 'Wisla Plock' then 'Wisła Płock'
            else ujednolicona_nazwa
        end as ujednolicona_nazwa
    from
        unioned
    where druzyna_zawodnik not in 
    ('SZYBKI STRZAŁ (MAX 200 PLN)', 'co najmniej 1 VAR sędziego głównego przy monitorze')
)

select * from final
order by ujednolicona_nazwa

-- AGO ROGUE -> Rogue
-- Fenix Toulouse Handball -> Toulouse
-- Puławy -> KS Azoty Puławy
-- Opole -> KPR Gwardia Opole
-- Vitoria SC Guimaraes -> Vitoria Guimaraes
-- Warta -> Warta Poznań
-- Wisla Plock -> Wisła Płock