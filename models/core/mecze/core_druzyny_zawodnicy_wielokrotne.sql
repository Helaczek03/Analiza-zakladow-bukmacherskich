with
source as (
    select * from {{ ref('core_druzyny_zawodnicy') }}
),

mnogie_nazwy as (
    select
        pierwsze_dluzsze_slowo,
        count(1) as liczba_wystapien
    from 
        source
    group by 
        pierwsze_dluzsze_slowo
    having 
        count(1) > 1
),

ujednolicone_nazwy as (
    select
        pierwsze_dluzsze_slowo,
        druzyna_zawodnik,
        case
            when druzyna_zawodnik = 'RED Academy' then 'RED Academy'
            when druzyna_zawodnik = 'Al Ahly Kair' then 'Al Ahly Kair'
            when druzyna_zawodnik = 'Alianza Lima' then 'Alianza Lima'
            when druzyna_zawodnik = 'Andreeva, Mirra' then 'Andreeva, Mirra'
            when druzyna_zawodnik = 'Andreeva M.' then 'Andreeva, Mirra'
            when druzyna_zawodnik = 'Argentina' then 'Argentyna'
            when druzyna_zawodnik = 'Arsenal de Sarandi' then 'Arsenal de Sarandi'
            when druzyna_zawodnik = 'Arsenal [K]' then 'Arsenal [K]'
            when druzyna_zawodnik = 'Atalanta BC' then 'Atalanta'
            when druzyna_zawodnik = 'Atalanta' then 'Atalanta'
            when druzyna_zawodnik = 'Athletic Club K' then 'Athletic Bilbao [K]'
            when druzyna_zawodnik = 'Austria' then 'Austria'
            when druzyna_zawodnik = 'BM Atletico Valladolid' then 'BM Atletico Valladolid'
            when druzyna_zawodnik = 'Atletico Madryt [K]' then 'Atletico Madryt [K]'
            when druzyna_zawodnik = 'Atletico FC Cali' then 'Atletico FC Cali'
            when druzyna_zawodnik = 'Bayern Monachium [K]' then 'Bayern Monachium [K]'
            when druzyna_zawodnik = 'Bayern München' then 'Bayern Monachium'
            when druzyna_zawodnik = 'Bayern Munich' then 'Bayern Monachium'
            when druzyna_zawodnik = 'Bayern' then 'Bayern Monachium'
            when druzyna_zawodnik = 'Benfica Lizbona [K]' then 'Benfica Lizbona [K]'
            when druzyna_zawodnik = 'SL Benfica' then 'Benfica Lizbona'
            when druzyna_zawodnik = 'Benfica Lisbonu' then 'Benfica Lizbona'
            when druzyna_zawodnik = 'Benfica Lizbona' then 'Benfica Lizbona'
            when druzyna_zawodnik = 'Benfica Lisboa' then 'Benfica Lizbona'
            when druzyna_zawodnik = 'Benfica Lisbon' then 'Benfica Lizbona'
            when druzyna_zawodnik = 'Benfica' then 'Benfica Lizbona'
            when druzyna_zawodnik = 'Borussia Monchengladbach' then 'Borussia Monchengladbach'
            when druzyna_zawodnik = 'Borussia M`gladbach' then 'Borussia Monchengladbach'
            when druzyna_zawodnik = 'Borussia Dortmund' then 'Borussia Dortmund'
            when druzyna_zawodnik = 'Brazil' then 'Brazylia'
            when druzyna_zawodnik = 'Brighton & Hove Albion' then 'Brighton'
            when druzyna_zawodnik = 'Brighton' then 'Brighton'
            when druzyna_zawodnik = 'Bulgaria' then 'Bułgaria'
            when druzyna_zawodnik = 'RK Celje' then 'RK Celje'
            when druzyna_zawodnik = 'Club Independiente Petrolero' then 'Club Independiente Petrolero'
            when druzyna_zawodnik = 'Club General Caballero Jlm' then 'Club General Caballero Jlm'
            when druzyna_zawodnik = 'Club Atlético de Madrid' then 'Atletico Madryt'
            when druzyna_zawodnik = 'Club Deportivo Eldense' then 'Club Deportivo Eldense'
            when druzyna_zawodnik = 'Club Joventut Badalona' then 'Club Joventut Badalona'
            when druzyna_zawodnik = 'Club Brugge' then 'Club Brugge'
            when druzyna_zawodnik = 'Collins, Kylie' then 'Collins, Kylie'
            when druzyna_zawodnik = 'Croatia' then 'Chorwacja'
            when druzyna_zawodnik = 'FK Crvena Zvezda Belgrade' then 'Crvena Zvezda Belgrade'
            when druzyna_zawodnik = 'KK Crvena zvezda Belgrade' then 'Crvena Zvezda Belgrade'
            when druzyna_zawodnik = 'Crvena Zvezda' then 'Crvena Zvezda Belgrade'
            when druzyna_zawodnik = 'Czech Republic' then 'Czechy'
            when druzyna_zawodnik = 'Dania K' then 'Dania [K]'
            when druzyna_zawodnik = 'Deportivo Paraguayo' then 'Deportivo Paraguayo'
            when druzyna_zawodnik = 'Deportivo Achuapa' then 'Deportivo Achuapa'
            when druzyna_zawodnik = 'Deportivo Alaves' then 'Deportivo Alaves'
            when druzyna_zawodnik = 'Deportivo Alavés' then 'Deportivo Alaves'
            when druzyna_zawodnik = 'Dessolis, Barbara' then 'Dessolis, Barbara'
            when druzyna_zawodnik = 'CS Dinamo Bucuresti' then 'Dinamo Bukareszt'
            when druzyna_zawodnik = 'CS Dinamo Bukareszt' then 'Dinamo Bukareszt'
            when druzyna_zawodnik = 'Dinamo Bukareszt' then 'Dinamo Bukareszt'
            when druzyna_zawodnik = 'GNK Dinamo Zagreb' then 'GNK Dinamo Zagrzeb'
            when druzyna_zawodnik = 'FC Dinamo Batumi' then 'FC Dinamo Batumi'
            when druzyna_zawodnik = 'Dinamo Batumi' then 'FC Dinamo Batumi'
            when druzyna_zawodnik = 'USL Dunkerque' then 'Dunkerque'
            when druzyna_zawodnik = 'Dunkerque HB' then 'Dunkerque'
            when druzyna_zawodnik = 'Dunkerque' then 'Dunkerque'
            when druzyna_zawodnik = 'Eintracht Braunschweig' then 'Eintracht Braunschweig'
            when druzyna_zawodnik = 'Eintracht Spandau' then 'Eintracht Spandau'
            when druzyna_zawodnik = 'LNG Esports' then 'LNG Esports'
            when druzyna_zawodnik = 'G2 Esports' then 'G2 Esports'
            when druzyna_zawodnik = 'Evans D / Murray A' then 'Evans, Daniel / Murray, Andy'
            when druzyna_zawodnik = 'Faroe Islands' then 'Wyspy Owcze'
            when druzyna_zawodnik = 'Fnatic' then 'Fnatic'
            when druzyna_zawodnik = 'France' then 'Francja'
            when druzyna_zawodnik = 'Fritz T / Pegula J' then 'Fritz, Taylor / Pegula, Jessica'
            when druzyna_zawodnik = 'SK Gaming Prime' then 'SK Gaming Prime'
            when druzyna_zawodnik = 'JD Gaming' then 'JD Gaming'
            when druzyna_zawodnik = 'Gornik Zabrze' then 'Górnik Zabrze'
            when druzyna_zawodnik = 'Hapoel Tel-Aviv' then 'Hapoel Tel-Aviv'
            when druzyna_zawodnik = 'Heart of Lions' then 'Heart of Lions'
            when druzyna_zawodnik = '1. FC Heidenheim' then 'FC Heidenheim'
            when druzyna_zawodnik = 'Heidenheim' then 'FC Heidenheim'
            when druzyna_zawodnik = 'AL Hilal (KSA)' then 'Al-Hilal Riyadh'
            when druzyna_zawodnik = 'Al Hilal SFC' then 'Al-Hilal Riyadh'
            when druzyna_zawodnik = 'Hurkacz H / Swiatek I' then 'Hurkacz, Hubert / Świątek, Iga'
            when druzyna_zawodnik = 'Hurkacz H / Świątek I' then 'Hurkacz, Hubert / Świątek, Iga'
            when druzyna_zawodnik = 'Inter Miami CF' then 'Inter Miami CF'
            when druzyna_zawodnik = 'Inter Mediolan' then 'Inter Mediolan'
            when druzyna_zawodnik = 'Inter Milano' then 'Inter Mediolan'
            when druzyna_zawodnik = 'Inter Milan' then 'Inter Mediolan'
            when druzyna_zawodnik = 'Inter' then 'Inter Mediolan'
            when druzyna_zawodnik = 'Irlandia' then 'Irlandia'
            when druzyna_zawodnik = 'Italy' then 'Włochy'
            when druzyna_zawodnik = 'Jagiellonia Bialystok' then 'Jagiellonia Białystok'
            when druzyna_zawodnik = 'Jagiellonia Białystok' then 'Jagiellonia Białystok'
            when druzyna_zawodnik = 'Juventus Turin' then 'Juventus Turyn'
            when druzyna_zawodnik = 'Juventus' then 'Juventus Turyn'
            when druzyna_zawodnik = 'GKS Katowice' then 'GKS Katowice'
            when druzyna_zawodnik = 'Kokkinakis T / Kyrgios N' then 'Kokkinakis, Thanasi / Kyrgios, Nick'
            when druzyna_zawodnik = 'Krueger, Ashlyn' then 'Krueger, Ashlyn'
            when druzyna_zawodnik = 'Kudermetova, Veronika' then 'Kudermetova, Veronika'
            when druzyna_zawodnik = 'Kudermetova V.' then 'Kudermetova, Veronika'
            when druzyna_zawodnik = 'Latvia' then 'Łotwa'
            when druzyna_zawodnik = 'Lazio Rome' then 'Lazio Rzym'
            when druzyna_zawodnik = 'Lazio Rzym' then 'Lazio Rzym'
            when druzyna_zawodnik = 'Lazio' then 'Lazio Rzym'
            when druzyna_zawodnik = 'KS Lechia Gdansk' then 'Lechia Gdańsk'
            when druzyna_zawodnik = 'Lechia Gdańsk' then 'Lechia Gdańsk'
            when druzyna_zawodnik = 'Lewandowski R. (BAR)' then 'Lewandowski, Robert'
            when druzyna_zawodnik = 'Lewandowski R. (POL)' then 'Lewandowski, Robert'
            when druzyna_zawodnik = 'Libertad Loja' then 'Libertad Loja'
            when druzyna_zawodnik = 'Man. Utd.' then 'Manchester United'
            when druzyna_zawodnik = 'Man. Utd' then 'Manchester United'
            when druzyna_zawodnik = 'Manchester United [K]' then 'Manchester United [K]'
            when druzyna_zawodnik = 'Manchester City' then 'Manchester City'
            when druzyna_zawodnik = 'Man. City' then 'Manchester City'
            when druzyna_zawodnik = 'Martinez, Pedro' then 'Martinez, Pedro'
            when druzyna_zawodnik = 'de Minaur, Alex' then 'De Minaur, Alex'
            when druzyna_zawodnik = 'A. De Minaur' then 'De Minaur, Alex'
            when druzyna_zawodnik = 'De Minaur A.' then 'De Minaur, Alex'
            when druzyna_zawodnik = 'Molde FK 2' then 'Molde FK 2'
            when druzyna_zawodnik = 'Nacional Asuncion' then 'Nacional Asuncion'
            when druzyna_zawodnik = 'Nadal, Rafael' then 'Nadal, Rafael'
            when druzyna_zawodnik = 'Nadal R.' then 'Nadal, Rafael'
            when druzyna_zawodnik = 'R. Nadal' then 'Nadal, Rafael'
            when druzyna_zawodnik = 'FC Nantes Esports' then 'Nantes'
            when druzyna_zawodnik = 'HBC Nantes' then 'Nantes'
            when druzyna_zawodnik = 'FC Nantes' then 'Nantes'
            when druzyna_zawodnik = 'Nantes' then 'Nantes'
            when druzyna_zawodnik = 'Nava Em.' then 'Nava, Emilio'
            when druzyna_zawodnik = 'BM Nava' then 'BM Nava'
            when druzyna_zawodnik = 'Nongshim Red Force' then 'Nongshim Red Force'
            when druzyna_zawodnik = 'Norway' then 'Norwegia'
            when druzyna_zawodnik = 'Norwegia' then 'Norwegia'
            when druzyna_zawodnik = 'Norwegia K' then 'Norwegia [K]'
            when druzyna_zawodnik = 'Olympique de Marseille' then 'Olympique Marsylia'
            when druzyna_zawodnik = 'Olympique Marseille' then 'Olympique Marsylia'
            when druzyna_zawodnik = 'Olympique Lyon' then 'Olympique Lyon'
            when druzyna_zawodnik = 'PSG' then 'Paris Saint-Germain'
            when druzyna_zawodnik = 'Pogon Grodzisk Mazowiecki' then 'Pogoń Grodzisk Mazowiecki'
            when druzyna_zawodnik = 'Pogon Szczecin' then 'Pogoń Szczecin'
            when druzyna_zawodnik = 'Pogon Siedlce' then 'Pogon Siedlce'
            when druzyna_zawodnik = 'Poland' then 'Polska'
            when druzyna_zawodnik = 'Puszcza Niepolomice' then 'Puszcza Niepołomice'
            when druzyna_zawodnik = 'Puszcza Niepołomice' then 'Puszcza Niepołomice'
            when druzyna_zawodnik = 'W. Płock' then 'Wisła Płock'
            when druzyna_zawodnik = 'Płock' then 'Wisła Płock'
            when druzyna_zawodnik = 'Real Sociedad San Sebastian' then 'Real Sociedad'
            when druzyna_zawodnik = 'Real Sociedad de Fútbol' then 'Real Sociedad'
            when druzyna_zawodnik = 'Real Betis Balompié' then 'Real Betis'
            when druzyna_zawodnik = 'Real Betis Seville' then 'Real Betis'
            when druzyna_zawodnik = 'Real Madryt [K]' then 'Real Madryt [K]'
            when druzyna_zawodnik = 'Real Valladolid' then 'Real Valladolid'
            when druzyna_zawodnik = 'Real Esteli FC' then 'Real Esteli FC'
            when druzyna_zawodnik = 'Real Madrid CF' then 'Real Madryt'
            when druzyna_zawodnik = 'Real Sociedad' then 'Real Sociedad'
            when druzyna_zawodnik = 'Real Madrid' then 'Real Madryt'
            when druzyna_zawodnik = 'Real Madryt' then 'Real Madryt'
            when druzyna_zawodnik = 'Real Oviedo' then 'Real Oviedo'
            when druzyna_zawodnik = 'Romania' then 'Rumunia'
            when druzyna_zawodnik = 'Ruch Chorzow' then 'Ruch Chorzów'
            when druzyna_zawodnik = 'Ruch Chorzów' then 'Ruch Chorzów'
            when druzyna_zawodnik = 'Ruse E. G.' then 'Ruse, Elena-Gabriela'
            when druzyna_zawodnik = 'Ruse E-G' then 'Ruse, Elena-Gabriela'
            when druzyna_zawodnik = 'Ruud C / Eikeri U' then 'Ruud, Casper / Eikeri, Ulrikke'
            when druzyna_zawodnik = 'Santa Clara Azores' then 'Santa Clara'
            when druzyna_zawodnik = 'Santa Clara' then 'Santa Clara'
            when druzyna_zawodnik = 'Shabab AL Ordun' then 'Shabab AL Ordun'
            when druzyna_zawodnik = 'Slovenia' then 'Słowenia'
            when druzyna_zawodnik = 'Smith, Michael' then 'Smith, Michael'
            when druzyna_zawodnik = 'Smith, Ross' then 'Smith, Ross'
            when druzyna_zawodnik = 'Sousa, Pedro' then 'Sousa, Pedro'
            when druzyna_zawodnik = 'Spain' then 'Hiszpania'
            when druzyna_zawodnik = 'Sparta Rotterdam' then 'Sparta Rotterdam'
            when druzyna_zawodnik = 'Sparta Prague' then 'Sparta Praga'
            when druzyna_zawodnik = 'Sparta Praga' then 'Sparta Praga'
            when druzyna_zawodnik = 'Stade Lausanne Ouchy' then 'Stade Lausanne Ouchy'
            when druzyna_zawodnik = 'Stade Rennes' then 'Stade Rennes'
            when druzyna_zawodnik = 'ZKS Stal Rzeszow' then 'ZKS Stal Rzeszow'
            when druzyna_zawodnik = 'FKS Stal Mielec' then 'Stal Mielec'
            when druzyna_zawodnik = 'SPR Stal Mielec' then 'Stal Mielec'
            when druzyna_zawodnik = 'Stal Mielec' then 'Stal Mielec'
            when druzyna_zawodnik = 'Team Heretics' then 'Team Heretics'
            when druzyna_zawodnik = 'Team Vitality' then 'Team Vitality'
            when druzyna_zawodnik = 'Team Liquid' then 'Team Liquid'
            when druzyna_zawodnik = 'Team BDS' then 'Team BDS'
            when druzyna_zawodnik = 'Union Saint-Gilloise' then 'Union Saint-Gilloise'
            when druzyna_zawodnik = '1. FC Union Berlin' then 'FC Union Berlin'
            when druzyna_zawodnik = 'Union Comercio' then 'Union Comercio'
            when druzyna_zawodnik = 'Union Berlin' then 'FC Union Berlin'
            when druzyna_zawodnik = 'FC Viktoria Plzen' then 'Viktoria Pilzno'
            when druzyna_zawodnik = 'Viktoria Pilzno' then 'Viktoria Pilzno'
            when druzyna_zawodnik = 'KS Vive Kielce' then 'Iskra Kielce'
            when druzyna_zawodnik = 'Vive Kielce' then 'Iskra Kielce'
            when druzyna_zawodnik = 'KS Kielce' then 'Iskra Kielce'
            when druzyna_zawodnik = 'Kielce' then 'Iskra Kielce'
            when druzyna_zawodnik = 'Wang, Xinyu' then 'Wang, Xinyu'
            when druzyna_zawodnik = 'Wang Q.' then 'Wang, Qiang'
            when druzyna_zawodnik = 'Warta Poznan' then 'Warta Poznań'
            when druzyna_zawodnik = 'Warta Poznań' then 'Warta Poznań'
            when druzyna_zawodnik = 'Widzew Lodz' then 'Widzew Łódź'
            when druzyna_zawodnik = 'Widzew Łódź' then 'Widzew Łódź'
            when druzyna_zawodnik = 'Williams S.' then 'Williams, Serena'
            when druzyna_zawodnik = 'Wisla Krakow' then 'Wisła Kraków'
            when druzyna_zawodnik = 'Wisla Plock' then 'Wisla Płock'
            when druzyna_zawodnik = 'Wisła Kraków' then 'Wisła Kraków'
            when druzyna_zawodnik = 'Ymer, Mikael' then 'Ymer, Mikael'
            when druzyna_zawodnik = 'Ymer M.' then 'Ymer, Mikael'
            when druzyna_zawodnik = 'Ymer, Elias' then 'Ymer, Elias'
            when druzyna_zawodnik = 'Ymer E.' then 'Ymer, Elias'
            when druzyna_zawodnik = 'Young Apostles FC' then 'Young Apostles FC'
            when druzyna_zawodnik = 'KH Zaglebie Sosnowiec' then 'KH Zaglebie Sosnowiec'
            when druzyna_zawodnik = 'MKS Zaglebie Lubin' then 'Zagłębie Lubin'
            when druzyna_zawodnik = 'Zaglebie Lubin' then 'Zagłębie Lubin'
            when druzyna_zawodnik = 'Zverev A / Siegemund L' then 'Zverev, Alexander / Siegemund, Laura'

            when liczba_wystapien = 2 
            then first_value(druzyna_zawodnik) -- pierwsza nazwa
            OVER (
                PARTITION BY pierwsze_dluzsze_slowo
                ORDER BY length(druzyna_zawodnik) DESC, druzyna_zawodnik ASC
                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
            )
            else
                nth_value(druzyna_zawodnik, 2) -- przedostatnia nazwa
                OVER (
                    PARTITION BY pierwsze_dluzsze_slowo
                    ORDER BY length(druzyna_zawodnik) ASC, druzyna_zawodnik ASC
                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                ) end AS ujednolicona_nazwa,
        dyscyplina,
        --liczba_wystapien,
        data_zaladowania
    from
        source
    join
        mnogie_nazwy
    using
        (pierwsze_dluzsze_slowo)
    where
        data_zaladowania <= TO_TIMESTAMP('2025-11-01T16:51:42+00:00') --data pierwszego zaladowania
    order by 
        pierwsze_dluzsze_slowo
),

final as (
    select distinct
        druzyna_zawodnik,
        ujednolicona_nazwa
    from
        ujednolicone_nazwy
    --select * from ujednolicone_nazwy
)

select * from final

-- DONE teraz trzeba zrobic wspolna nazwe dla tych druzyn
-- NIEWYKONALNE jesli mamy zaklady specjalne to zmienic to na nazwe dyscypliny?
-- sprawdzic czy na pewno to ta sama druzyna
-- trzeba zrobic duzego case bo nie zawsze najdluzsza nazwa jest najlepsza
-- potrzebujemy date zaladowania druzyna/zawodnik, maksymalna data zaladowania sposrod konkretnej druzyna/zawodnik ??
-- dla wszystkich juz zaladowanych ustalamy wspolna nazwe
-- gdy przyjda nowe dane to ustawiamy im status niezatwierdzony
-- liczby wystapien nie trzeba wyswietlac, daty zaladowania moze tez ?

-- gdy mamy juz date zaladowania to trzeba teraz w koncu sprawdzic wspolne nazwy i ustawic status potwierdzony
-- w momencie gdy przyjda nowe dane to ustawiamy im status niepotwierdzony i manualnie sprawdzamy czy mozemy po prostu go zatwierdzic
-- po sprawdzeniu mozna ustawic warunek data zaladowania <= od 2025-11-01 to status bedzie potwierdzony


-- mamy juz sprawdzone wszystkie nazwy dla group by i count (1) > 1