with
source as (
    select distinct 
        id_rozgrywek, 
        nazwa_rozgrywek, 
        dyscyplina, 
        mecz 
    from 
        {{ ref('stg_stare_zdarzenia') }}
),

nearly_final as (
    select 
        id_rozgrywek,
        mecz,
        nazwa_rozgrywek,
        case id_rozgrywek
            when 2545 then '1 liga - Polska'
            when 71539 then '1 liga - Polska'
            when 43366 then 'LaLiga'
            when 43441 then 'Super Lig'
            when 71737 then 'Super Lig'
            when 43453 then 'Serie A'
            when 43467 then 'Liga Portugal'
            when 71743 then 'Liga Portugal'
            when 45054 then 'StarLigue'
            when 71997 then 'StarLigue'
            when 45203 then 'Bundesliga'
            when 71992 then 'Bundesliga'
            when 65218 then '1 liga - Boliwia'
            when 68263 then 'Eredivise'
            when 71570 then 'Eredivise'
            when 71412 then '1 liga - Francja'
            when 71413 then '1 liga - Słowacja'
            when 71415 then '1 liga - Szwecja'
            when 71419 then '1 liga - Szwajcaria'
            when 71815 then '1 liga - Szwajcaria'
            when 71522 then '1 liga - Urugwaj'
            when 71543 then '1 liga - Czechy'
            when 71556 then '1 liga - Belgia'
            when 71567 then '1 liga - Egipt'
            when 71603 then '1 liga - Peru'
            when 71611 then '1 liga - Dania'
            when 71622 then 'Bundesliga - Austria'
            when 71629 then '1 liga - Jordania'
            when 71631 then '1 liga - Ukraina'
            when 71632 then '1 liga - Grecja'
            when 71636 then '1 liga - Irlanida'
            when 71648 then '1 liga - Maroko'
            when 71689 then '1 liga - Rumunia'
            when 71694 then '1 liga - Szkocja'
            when 71831 then '1 liga - Salwador'
            when 71873 then '1 liga - Bułgaria'
            when 71890 then '1 liga - Hongkong'
            when 72005 then '1 liga - Hiszpania'
            when 72019 then '1 liga - Hiszpania'
            when 72034 then '1 liga - Chorwacja'
            when 72115 then '1 liga - Chorwacja'
            when 72101 then '1 liga - ZEA'
            when 72106 then '1 liga - Serbia'
            when 72114 then '1 liga - Węgry'
            when 72139 then '1 liga - Paragwaj'
            when 74139 then '1 liga - Paragwaj'
            when 72140 then '1 liga - Malta'
            when 72184 then '1 liga - Arabia Saudyjska'
            when 72223 then '1 liga - Azerbejdżan'
            when 72357 then '1 liga - Luksemburg'
            when 72417 then '1 liga - Nikaragua'
            when 72568 then '1 liga - Niemcy'
            when 72614 then '1 liga - Włochy'
            when 72797 then '1 liga - Albania'
            when 72992 then '1 liga - Ghana'
            when 73271 then '1 liga - Algieria'
            when 73305 then '1 liga - Andora'
            when 73686 then '1 liga - Nigeria'
            when 74454 then '1 liga - Gwatemala'
            when 75277 then '1 liga - Wybrzeże Kości Słoniowej'
            when 77609 then '1 liga - Argentyna'
            when 77725 then '1 liga - Kolumbia'

            when 71615 then '1 liga kobiet - Szwecja'
            when 72043 then '1 liga kobiet - Węgry'
            when 72126 then '1 liga kobiet - Hiszpania'
            when 72204 then '1 liga kobiet - Włochy'
            when 72386 then '1 liga kobiet - Słowacja'
            when 74960 then '1 liga kobiet - Niemcy'
            when 83365 then '1 liga kobiet - Argentyna'
            when 148338 then '1 liga kobiet - Szwajcaria'
            when 71519 then '2 liga - Kolumbia'
            when 71555 then '2 liga - Anglia'
            when 71661 then '2 liga - Portugalia'
            when 71673 then '2 liga - Dania'
            when 71690 then '2 liga - Kostaryka'
            when 71792 then '2 liga - Serbia'
            when 71841 then '2 liga - Dominikana'
            when 72123 then '2 liga - Japonia'
            when 72421 then '2 liga - Tajlandia'
            when 73786 then '2 liga - Indie'
            when 73825 then '2 liga - Meksyk'
            when 80072 then '2 liga - Czechy'
            when 80962 then '2 liga - Belgia'
            when 92237 then '2 liga - Austria'

            when 77002 then '3 liga grupa 2 - Norwegia'
            when 71590 then '3 liga grupa B - Włochy'
            when 78384 then '4 liga grupa 1 - Norwegia'
            when 78381 then '4 liga grupa 2 - Norwegia'
            when 73374 then '5 liga - Argentyna'

            when 64538 then 'United Cup'
            when 82101 then 'Abu Dhabi'
            when 45839 then 'Astana'
            when 66665 then 'Banja Luka'
            when 53476 then 'WTA Finals'
            when 53548 then 'ATP Finals'
            when 65953 then 'LEC'
            when 78487 then 'Liga Europy - kwalifikacje'
            when 72306 then 'Liga młodzieżowa U21 - Belgia'
            when 85469 then 'Liga rezerw - Argentyna'
            when 72983 then 'Mistrzostwa Europy'
            when 73949 then 'Klubowe Mistrzostwa Świata'
            when 75982 then 'Copa America'
            when 84081 then 'Mistrzostwa Świata'
            when 88254 then 'Mistrzostwa Europy U20'
            when 46523 then 'Mistrzostwa Europy Kobiet'
            when 46226 then 'Mistrzostwa Narodów Afryki - kwalifikacje'
            when 63752 then 'Mistrzostwa Świata'
            when 88337 then 'Mistrzostwa Świata kobiet'
            --teraz trzeba zrobic puchar
            when 3269 then 'Puchar Polski'
            when 3424 then 'Puchar Hiszpanii'
            when 4156 then 'Puchar Francji'
            when 7849 then 'Puchar Włoch'
            when 28300 then 'Puchar Niemiec'
            when 43706 then 'Puchar Portugalii'
            when 44989 then 'Puchar Włoch'
            when 71577 then 'Puchar Niemiec'
            when 71836 then 'Puchar Portugalii'
            when 71932 then 'Puchar Turcji'
            when 72133 then 'Puchar Polski'
            when 72405 then 'Puchar Bułgarii'
            when 72489 then 'Puchar Włoch'
            when 72688 then 'Puchar Anglii'
            when 72903 then 'Puchar Danii'
            when 72925 then 'Puchar Hiszpanii'
            when 73915 then 'Puchar Francji'
            when 74573 then 'Puchar Polski'
            when 76603 then 'Puchar Niemiec'
            when 93815 then 'Puchar Polski'
            when 44356 then 'Liga Europejska'
            when 3261 then 'Puchar Anglii'
            when 46724 then 'Puchar Portugalii'
            when 72508 then 'Puchar Izraela'
            when 73568 then 'Puchar Portugalii'
            when 73595 then 'Puchar Anglii'
            when 50888 then 'San Jose'
            when 3295 then 'Superpuchar Hiszpanii'
            when 71541 then 'Superpuchar Polski'
            when 73266 then 'Superpuchar Włoch'
            when 73603 then 'Superpuchar Hiszpanii'
            when 73675 then 'Superpuchar Francji'
            when 76869 then 'Superpuchar Niemiec'
            when 78517 then 'Mecze towarzyskie'
            when 24596 then 'Mecze towarzyskie'
            when 68076 then 'Warszawa'
            when 68069 then 'Warszawa'
            when 59688 then 'Warszawa'
            when 34118 then 'Mistrzostwa Świata'
            when 62009 then 'Mistrzostwa Świata'
            when 42782 then 'Mistrzostwa Świata'
            when 34604 then 'Eliminacje Mistrzostw Europy'

            else nazwa_rozgrywek
        end as poprawna_nazwa_rozgrywek,
        dyscyplina
    from source
    order by nazwa_rozgrywek, id_rozgrywek
),

final as (
    select distinct
        id_rozgrywek,
        nazwa_rozgrywek,
        case 
            when id_rozgrywek = 71570 and dyscyplina = 'Żużel'
            then nazwa_rozgrywek
            else poprawna_nazwa_rozgrywek
        end as poprawna_nazwa_rozgrywek
    from nearly_final
    order by /*id_rozgrywek,*/ nazwa_rozgrywek
)   

select * from final