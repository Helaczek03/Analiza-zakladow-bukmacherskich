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
        `druzyna/zawodnik`,
        case
            when `druzyna/zawodnik` = 'RED Academy' then 'RED Academy'
            when `druzyna/zawodnik` = 'Al Ahly Kair' then 'Al Ahly Kair'
            when `druzyna/zawodnik` = 'Alianza Lima' then 'Alianza Lima'
            when `druzyna/zawodnik` = 'Andreeva, Mirra' then 'Andreeva, Mirra'
            when `druzyna/zawodnik` = 'Andreeva M.' then 'Andreeva, Mirra'
            when `druzyna/zawodnik` = 'Argentina' then 'Argentyna'
            when `druzyna/zawodnik` = 'Arsenal de Sarandi' then 'Arsenal de Sarandi'
            when `druzyna/zawodnik` = 'Arsenal [K]' then 'Arsenal [K]'
            when `druzyna/zawodnik` = 'Atalanta BC' then 'Atalanta'
            when `druzyna/zawodnik` = 'Atalanta' then 'Atalanta'
            when `druzyna/zawodnik` = 'Athletic Club K' then 'Athletic Bilbao [K]'
            when `druzyna/zawodnik` = 'Austria' then 'Austria'
            when `druzyna/zawodnik` = 'BM Atletico Valladolid' then 'BM Atletico Valladolid'
            when `druzyna/zawodnik` = 'Atletico Madryt [K]' then 'Atletico Madryt [K]'
            when `druzyna/zawodnik` = 'Atletico FC Cali' then 'Atletico FC Cali'
            when `druzyna/zawodnik` = 'Bayern Monachium [K]' then 'Bayern Monachium [K]'
            when `druzyna/zawodnik` = 'Bayern München' then 'Bayern Monachium'
            when `druzyna/zawodnik` = 'Bayern Munich' then 'Bayern Monachium'
            when `druzyna/zawodnik` = 'Bayern' then 'Bayern Monachium'
            when `druzyna/zawodnik` = 'Benfica Lizbona [K]' then 'Benfica Lizbona [K]'
            when `druzyna/zawodnik` = 'SL Benfica' then 'Benfica Lizbona'
            when `druzyna/zawodnik` = 'Benfica Lisbonu' then 'Benfica Lizbona'
            when `druzyna/zawodnik` = 'Benfica Lizbona' then 'Benfica Lizbona'
            when `druzyna/zawodnik` = 'Benfica Lisboa' then 'Benfica Lizbona'
            when `druzyna/zawodnik` = 'Benfica Lisbon' then 'Benfica Lizbona'
            when `druzyna/zawodnik` = 'Benfica' then 'Benfica Lizbona'
            when `druzyna/zawodnik` = 'Borussia Monchengladbach' then 'Borussia Monchengladbach'
            when `druzyna/zawodnik` = 'Borussia M`gladbach' then 'Borussia Monchengladbach'
            when `druzyna/zawodnik` = 'Borussia Dortmund' then 'Borussia Dortmund'
            when `druzyna/zawodnik` = 'Brazil' then 'Brazylia'
            when `druzyna/zawodnik` = 'Brighton & Hove Albion' then 'Brighton'
            when `druzyna/zawodnik` = 'Brighton' then 'Brighton'
            when `druzyna/zawodnik` = 'Bulgaria' then 'Bułgaria'
            when `druzyna/zawodnik` = 'RK Celje' then 'RK Celje'
            when `druzyna/zawodnik` = 'Club Independiente Petrolero' then 'Club Independiente Petrolero'
            when `druzyna/zawodnik` = 'Club General Caballero Jlm' then 'Club General Caballero Jlm'
            when `druzyna/zawodnik` = 'Club Atlético de Madrid' then 'Atletico Madryt'
            when `druzyna/zawodnik` = 'Club Deportivo Eldense' then 'Club Deportivo Eldense'
            when `druzyna/zawodnik` = 'Club Joventut Badalona' then 'Club Joventut Badalona'
            when `druzyna/zawodnik` = 'Club Brugge' then 'Club Brugge'
            when `druzyna/zawodnik` = 'Collins, Kylie' then 'Collins, Kylie'
            when `druzyna/zawodnik` = 'Croatia' then 'Chorwacja'
            when `druzyna/zawodnik` = 'FK Crvena Zvezda Belgrade' then 'Crvena Zvezda Belgrade'
            when `druzyna/zawodnik` = 'KK Crvena zvezda Belgrade' then 'Crvena Zvezda Belgrade'
            when `druzyna/zawodnik` = 'Crvena Zvezda' then 'Crvena Zvezda Belgrade'
            when `druzyna/zawodnik` = 'Czech Republic' then 'Czechy'
            when `druzyna/zawodnik` = 'Dania K' then 'Dania [K]'
            when `druzyna/zawodnik` = 'Deportivo Paraguayo' then 'Deportivo Paraguayo'
            when `druzyna/zawodnik` = 'Deportivo Achuapa' then 'Deportivo Achuapa'
            when `druzyna/zawodnik` = 'Deportivo Alaves' then 'Deportivo Alaves'
            when `druzyna/zawodnik` = 'Deportivo Alavés' then 'Deportivo Alaves'
            when `druzyna/zawodnik` = 'Dessolis, Barbara' then 'Dessolis, Barbara'
            when `druzyna/zawodnik` = 'CS Dinamo Bucuresti' then 'Dinamo Bukareszt'
            when `druzyna/zawodnik` = 'CS Dinamo Bukareszt' then 'Dinamo Bukareszt'
            when `druzyna/zawodnik` = 'Dinamo Bukareszt' then 'Dinamo Bukareszt'
            when `druzyna/zawodnik` = 'GNK Dinamo Zagreb' then 'GNK Dinamo Zagrzeb'
            when `druzyna/zawodnik` = 'FC Dinamo Batumi' then 'FC Dinamo Batumi'
            when `druzyna/zawodnik` = 'Dinamo Batumi' then 'FC Dinamo Batumi'
            when `druzyna/zawodnik` = 'USL Dunkerque' then 'Dunkerque'
            when `druzyna/zawodnik` = 'Dunkerque HB' then 'Dunkerque'
            when `druzyna/zawodnik` = 'Dunkerque' then 'Dunkerque'
            when `druzyna/zawodnik` = 'Eintracht Braunschweig' then 'Eintracht Braunschweig'
            when `druzyna/zawodnik` = 'Eintracht Spandau' then 'Eintracht Spandau'
            when `druzyna/zawodnik` = 'LNG Esports' then 'LNG Esports'
            when `druzyna/zawodnik` = 'G2 Esports' then 'G2 Esports'
            when `druzyna/zawodnik` = 'Evans D / Murray A' then 'Evans, Daniel / Murray, Andy'
            when `druzyna/zawodnik` = 'Faroe Islands' then 'Wyspy Owcze'
            when `druzyna/zawodnik` = 'Fnatic' then 'Fnatic'
            when `druzyna/zawodnik` = 'France' then 'Francja'
            when `druzyna/zawodnik` = 'Fritz T / Pegula J' then 'Fritz, Taylor / Pegula, Jessica'
            when `druzyna/zawodnik` = 'SK Gaming Prime' then 'SK Gaming Prime'
            when `druzyna/zawodnik` = 'JD Gaming' then 'JD Gaming'
            when `druzyna/zawodnik` = 'Gornik Zabrze' then 'Górnik Zabrze'
            when `druzyna/zawodnik` = 'Hapoel Tel-Aviv' then 'Hapoel Tel-Aviv'
            when `druzyna/zawodnik` = 'Heart of Lions' then 'Heart of Lions'
            when `druzyna/zawodnik` = '1. FC Heidenheim' then 'FC Heidenheim'
            when `druzyna/zawodnik` = 'Heidenheim' then 'FC Heidenheim'
            when `druzyna/zawodnik` = 'AL Hilal (KSA)' then 'Al-Hilal Riyadh'
            when `druzyna/zawodnik` = 'Al Hilal SFC' then 'Al-Hilal Riyadh'
            when `druzyna/zawodnik` = 'Hurkacz H / Swiatek I' then 'Hurkacz, Hubert / Świątek, Iga'
            when `druzyna/zawodnik` = 'Hurkacz H / Świątek I' then 'Hurkacz, Hubert / Świątek, Iga'
            when `druzyna/zawodnik` = 'Inter Miami CF' then 'Inter Miami CF'
            when `druzyna/zawodnik` = 'Inter Mediolan' then 'Inter Mediolan'
            when `druzyna/zawodnik` = 'Inter Milano' then 'Inter Mediolan'
            when `druzyna/zawodnik` = 'Inter Milan' then 'Inter Mediolan'
            when `druzyna/zawodnik` = 'Inter' then 'Inter Mediolan'
            when `druzyna/zawodnik` = 'Irlandia' then 'Irlandia'
            when `druzyna/zawodnik` = 'Italy' then 'Włochy'
            when `druzyna/zawodnik` = 'Jagiellonia Bialystok' then 'Jagiellonia Białystok'
            when `druzyna/zawodnik` = 'Jagiellonia Białystok' then 'Jagiellonia Białystok'
            when `druzyna/zawodnik` = 'Juventus Turin' then 'Juventus Turyn'
            when `druzyna/zawodnik` = 'Juventus' then 'Juventus Turyn'
            when `druzyna/zawodnik` = 'GKS Katowice' then 'GKS Katowice'
            when `druzyna/zawodnik` = 'Kokkinakis T / Kyrgios N' then 'Kokkinakis, Thanasi / Kyrgios, Nick'
            when `druzyna/zawodnik` = 'Krueger, Ashlyn' then 'Krueger, Ashlyn'
            when `druzyna/zawodnik` = 'Kudermetova, Veronika' then 'Kudermetova, Veronika'
            when `druzyna/zawodnik` = 'Kudermetova V.' then 'Kudermetova, Veronika'
            when `druzyna/zawodnik` = 'Latvia' then 'Łotwa'
            when `druzyna/zawodnik` = 'Lazio Rome' then 'Lazio Rzym'
            when `druzyna/zawodnik` = 'Lazio Rzym' then 'Lazio Rzym'
            when `druzyna/zawodnik` = 'Lazio' then 'Lazio Rzym'
            when `druzyna/zawodnik` = 'KS Lechia Gdansk' then 'Lechia Gdańsk'
            when `druzyna/zawodnik` = 'Lechia Gdańsk' then 'Lechia Gdańsk'
            when `druzyna/zawodnik` = 'Lewandowski R. (BAR)' then 'Lewandowski, Robert'
            when `druzyna/zawodnik` = 'Lewandowski R. (POL)' then 'Lewandowski, Robert'
            when `druzyna/zawodnik` = 'Libertad Loja' then 'Libertad Loja'
            when `druzyna/zawodnik` = 'Man. Utd.' then 'Manchester United'
            when `druzyna/zawodnik` = 'Man. Utd' then 'Manchester United'
            when `druzyna/zawodnik` = 'Manchester United [K]' then 'Manchester United [K]'
            when `druzyna/zawodnik` = 'Manchester City' then 'Manchester City'
            when `druzyna/zawodnik` = 'Man. City' then 'Manchester City'
            when `druzyna/zawodnik` = 'Martinez, Pedro' then 'Martinez, Pedro'
            when `druzyna/zawodnik` = 'de Minaur, Alex' then 'De Minaur, Alex'
            when `druzyna/zawodnik` = 'A. De Minaur' then 'De Minaur, Alex'
            when `druzyna/zawodnik` = 'De Minaur A.' then 'De Minaur, Alex'
            when `druzyna/zawodnik` = 'Molde FK 2' then 'Molde FK 2'
            when `druzyna/zawodnik` = 'Nacional Asuncion' then 'Nacional Asuncion'
            when `druzyna/zawodnik` = 'Nadal, Rafael' then 'Nadal, Rafael'
            when `druzyna/zawodnik` = 'Nadal R.' then 'Nadal, Rafael'
            when `druzyna/zawodnik` = 'R. Nadal' then 'Nadal, Rafael'
            when `druzyna/zawodnik` = 'FC Nantes Esports' then 'Nantes'
            when `druzyna/zawodnik` = 'HBC Nantes' then 'Nantes'
            when `druzyna/zawodnik` = 'FC Nantes' then 'Nantes'
            when `druzyna/zawodnik` = 'Nantes' then 'Nantes'
            when `druzyna/zawodnik` = 'Nava Em.' then 'Nava, Emilio'
            when `druzyna/zawodnik` = 'BM Nava' then 'BM Nava'
            when `druzyna/zawodnik` = 'Nongshim Red Force' then 'Nongshim Red Force'
            when `druzyna/zawodnik` = 'Norway' then 'Norwegia'
            when `druzyna/zawodnik` = 'Norwegia' then 'Norwegia'
            when `druzyna/zawodnik` = 'Norwegia K' then 'Norwegia [K]'
            when `druzyna/zawodnik` = 'Olympique de Marseille' then 'Olympique Marsylia'
            when `druzyna/zawodnik` = 'Olympique Marseille' then 'Olympique Marsylia'
            when `druzyna/zawodnik` = 'Olympique Lyon' then 'Olympique Lyon'
            when `druzyna/zawodnik` = 'PSG' then 'Paris Saint-Germain'
            when `druzyna/zawodnik` = 'Pogon Grodzisk Mazowiecki' then 'Pogoń Grodzisk Mazowiecki'
            when `druzyna/zawodnik` = 'Pogon Szczecin' then 'Pogoń Szczecin'
            when `druzyna/zawodnik` = 'Pogon Siedlce' then 'Pogon Siedlce'
            when `druzyna/zawodnik` = 'Poland' then 'Polska'
            when `druzyna/zawodnik` = 'Puszcza Niepolomice' then 'Puszcza Niepołomice'
            when `druzyna/zawodnik` = 'Puszcza Niepołomice' then 'Puszcza Niepołomice'
            when `druzyna/zawodnik` = 'W. Płock' then 'Wisła Płock'
            when `druzyna/zawodnik` = 'Płock' then 'Wisła Płock'
            when `druzyna/zawodnik` = 'Real Sociedad San Sebastian' then 'Real Sociedad'
            when `druzyna/zawodnik` = 'Real Sociedad de Fútbol' then 'Real Sociedad'
            when `druzyna/zawodnik` = 'Real Betis Balompié' then 'Real Betis'
            when `druzyna/zawodnik` = 'Real Betis Seville' then 'Real Betis'
            when `druzyna/zawodnik` = 'Real Madryt [K]' then 'Real Madryt [K]'
            when `druzyna/zawodnik` = 'Real Valladolid' then 'Real Valladolid'
            when `druzyna/zawodnik` = 'Real Esteli FC' then 'Real Esteli FC'
            when `druzyna/zawodnik` = 'Real Madrid CF' then 'Real Madryt'
            when `druzyna/zawodnik` = 'Real Sociedad' then 'Real Sociedad'
            when `druzyna/zawodnik` = 'Real Madrid' then 'Real Madryt'
            when `druzyna/zawodnik` = 'Real Madryt' then 'Real Madryt'
            when `druzyna/zawodnik` = 'Real Oviedo' then 'Real Oviedo'
            when `druzyna/zawodnik` = 'Romania' then 'Rumunia'
            when `druzyna/zawodnik` = 'Ruch Chorzow' then 'Ruch Chorzów'
            when `druzyna/zawodnik` = 'Ruch Chorzów' then 'Ruch Chorzów'
            when `druzyna/zawodnik` = 'Ruse E. G.' then 'Ruse, Elena-Gabriela'
            when `druzyna/zawodnik` = 'Ruse E-G' then 'Ruse, Elena-Gabriela'
            when `druzyna/zawodnik` = 'Ruud C / Eikeri U' then 'Ruud, Casper / Eikeri, Ulrikke'
            when `druzyna/zawodnik` = 'Santa Clara Azores' then 'Santa Clara'
            when `druzyna/zawodnik` = 'Santa Clara' then 'Santa Clara'
            when `druzyna/zawodnik` = 'Shabab AL Ordun' then 'Shabab AL Ordun'
            when `druzyna/zawodnik` = 'Slovenia' then 'Słowenia'
            when `druzyna/zawodnik` = 'Smith, Michael' then 'Smith, Michael'
            when `druzyna/zawodnik` = 'Smith, Ross' then 'Smith, Ross'
            when `druzyna/zawodnik` = 'Sousa, Pedro' then 'Sousa, Pedro'
            when `druzyna/zawodnik` = 'Spain' then 'Hiszpania'
            when `druzyna/zawodnik` = 'Sparta Rotterdam' then 'Sparta Rotterdam'
            when `druzyna/zawodnik` = 'Sparta Prague' then 'Sparta Praga'
            when `druzyna/zawodnik` = 'Sparta Praga' then 'Sparta Praga'
            when `druzyna/zawodnik` = 'Stade Lausanne Ouchy' then 'Stade Lausanne Ouchy'
            when `druzyna/zawodnik` = 'Stade Rennes' then 'Stade Rennes'
            when `druzyna/zawodnik` = 'ZKS Stal Rzeszow' then 'ZKS Stal Rzeszow'
            when `druzyna/zawodnik` = 'FKS Stal Mielec' then 'Stal Mielec'
            when `druzyna/zawodnik` = 'SPR Stal Mielec' then 'Stal Mielec'
            when `druzyna/zawodnik` = 'Stal Mielec' then 'Stal Mielec'
            when `druzyna/zawodnik` = 'Team Heretics' then 'Team Heretics'
            when `druzyna/zawodnik` = 'Team Vitality' then 'Team Vitality'
            when `druzyna/zawodnik` = 'Team Liquid' then 'Team Liquid'
            when `druzyna/zawodnik` = 'Team BDS' then 'Team BDS'
            when `druzyna/zawodnik` = 'Union Saint-Gilloise' then 'Union Saint-Gilloise'
            when `druzyna/zawodnik` = '1. FC Union Berlin' then 'FC Union Berlin'
            when `druzyna/zawodnik` = 'Union Comercio' then 'Union Comercio'
            when `druzyna/zawodnik` = 'Union Berlin' then 'FC Union Berlin'
            when `druzyna/zawodnik` = 'FC Viktoria Plzen' then 'Viktoria Pilzno'
            when `druzyna/zawodnik` = 'Viktoria Pilzno' then 'Viktoria Pilzno'
            when `druzyna/zawodnik` = 'KS Vive Kielce' then 'Iskra Kielce'
            when `druzyna/zawodnik` = 'Vive Kielce' then 'Iskra Kielce'
            when `druzyna/zawodnik` = 'KS Kielce' then 'Iskra Kielce'
            when `druzyna/zawodnik` = 'Kielce' then 'Iskra Kielce'
            when `druzyna/zawodnik` = 'Wang, Xinyu' then 'Wang, Xinyu'
            when `druzyna/zawodnik` = 'Wang Q.' then 'Wang, Qiang'
            when `druzyna/zawodnik` = 'Warta Poznan' then 'Warta Poznań'
            when `druzyna/zawodnik` = 'Warta Poznań' then 'Warta Poznań'
            when `druzyna/zawodnik` = 'Widzew Lodz' then 'Widzew Łódź'
            when `druzyna/zawodnik` = 'Widzew Łódź' then 'Widzew Łódź'
            when `druzyna/zawodnik` = 'Williams S.' then 'Williams, Serena'
            when `druzyna/zawodnik` = 'Wisla Krakow' then 'Wisła Kraków'
            when `druzyna/zawodnik` = 'Wisla Plock' then 'Wisla Płock'
            when `druzyna/zawodnik` = 'Wisła Kraków' then 'Wisła Kraków'
            when `druzyna/zawodnik` = 'Ymer, Mikael' then 'Ymer, Mikael'
            when `druzyna/zawodnik` = 'Ymer M.' then 'Ymer, Mikael'
            when `druzyna/zawodnik` = 'Ymer, Elias' then 'Ymer, Elias'
            when `druzyna/zawodnik` = 'Ymer E.' then 'Ymer, Elias'
            when `druzyna/zawodnik` = 'Young Apostles FC' then 'Young Apostles FC'
            when `druzyna/zawodnik` = 'KH Zaglebie Sosnowiec' then 'KH Zaglebie Sosnowiec'
            when `druzyna/zawodnik` = 'MKS Zaglebie Lubin' then 'Zagłębie Lubin'
            when `druzyna/zawodnik` = 'Zaglebie Lubin' then 'Zagłębie Lubin'
            when `druzyna/zawodnik` = 'Zverev A / Siegemund L' then 'Zverev, Alexander / Siegemund, Laura'

            when liczba_wystapien = 2 
            then first_value(`druzyna/zawodnik`) -- pierwsza nazwa
            OVER (
                PARTITION BY pierwsze_dluzsze_slowo
                ORDER BY length(`druzyna/zawodnik`) DESC, `druzyna/zawodnik` ASC
                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
            )
            else
                nth_value(`druzyna/zawodnik`, 2) -- przedostatnia nazwa
                OVER (
                    PARTITION BY pierwsze_dluzsze_slowo
                    ORDER BY length(`druzyna/zawodnik`) ASC, `druzyna/zawodnik` ASC
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
        `druzyna/zawodnik`,
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