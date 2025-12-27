with
source as (
    select distinct
        rodzaj_zakladu,
        co_obstawiono
    from
        {{ ref('core_int_zdarzenia') }}
),

numery_na_nazwy as (
    select
        case
            when rodzaj_zakladu like '%1. drużyna%' then replace(rodzaj_zakladu, '1. drużyna', 'Gospodarz')
            when rodzaj_zakladu like '%2. drużyna%' then replace(rodzaj_zakladu, '2. drużyna', 'Gość')
            else rodzaj_zakladu
        end as rodzaj_zakladu,
        co_obstawiono
    from
        source
),

final as(
    select
        rodzaj_zakladu,
        co_obstawiono,
        case rodzaj_zakladu
            when 'dokładny wynik (3)' then 'dokładny wynik'
            when '1x2' then 'Mecz'
            when 'Mecz - SuperOferta' then 'Mecz'
            when 'Winner' then 'Zwycięzca'
            when 'handicap (12)' then 'handicap'
            when 'handicap (1X2)' then 'handicap'
            when 'mecz' then 'Mecz'
            when 'winner' then 'Zwycięzca'
            when 'zwycięzca' then 'Zwycięzca'
            when 'zwycięzca (z dogrywką)' then 'Zwycięzca'
            when 'podwójna szansa' then 'Podwójna szansa'
            when 'Szybki Strzał (maksymalna stawka: 100 zł)' then 'SZYBKI STRZAŁ (max 100 PLN)'
            when 'Szybki Strzał (maksymalna stawka: 100 zł)' then 'SZYBKI STRZAŁ (max 200 PLN)'
            when 'podwójna szansa' then 'Mecz'
            when 'Podwójna szansa' then 'Mecz'
            when 'zwycięzca walki' then 'Zwycięzca'
            else rodzaj_zakladu
        end as ujednolicony_rodzaj_zakladu,

        case co_obstawiono
            when '#ERROR!' then 'Brak Danych'
            when '+' then 'Powyżej'
            when '-' then 'Poniżej'
            when '1' then 'Gospodarz'
            when '1 w rzutach karnych' then 'Gospodarz w rzutach karnych'
            when '1.1' then 'Gospodarz / Gospodarz'
            when '1.2' then 'Gospodarz / Gość'
            when '12' then 'Gospodarz lub Gość'
            when '1X' then 'Gospodarz lub Remis'
            when '2' then 'Gość'
            when '2 w rzutach karnych' then 'Gość w rzutach karnych'
            when '2.1' then 'Gość / Gospodarz'
            when '2:0/3' then '2:0'
            when 'TAK' then 'Tak'
            when 'V' then 'Zwycięzca'
            when 'X' then 'Remis'
            when 'X2' then 'Remis lub Gość'
            when 'remis' then 'Remis'
            when 'nie' then 'Nie'
            when 'tak' then 'Tak'
            when 'x' then 'Remis'
            else co_obstawiono
        end as ujednolicone_co_obstawiono
    from
        numery_na_nazwy
    order by 
        rodzaj_zakladu,
        co_obstawiono
)

select * from final