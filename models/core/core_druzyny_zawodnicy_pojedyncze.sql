with
source as (
    select * from {{ ref('core_druzyny_zawodnicy') }}
),

pojedyncze_nazwy as (
    select
        pierwsze_dluzsze_slowo
    from 
        source
    group by 
        pierwsze_dluzsze_slowo
    having 
        count(1) = 1
),

ujednolicone_nazwy as (
    select
        --pierwsze_dluzsze_slowo, -- czy tutaj potrzebne ?
        `druzyna/zawodnik`,
        case `druzyna/zawodnik`
            when 'Abdusattorov N.' then 'Abdusattorov, Nodirbek'
            when 'UD Almería' then 'UD Almeria'
            when 'Andorra' then 'Andora'
            when 'Atl. Madryt' then 'Atletico Madryt'
            when 'Azerbaijan' then 'Azerbejdżan'
            when 'KS Azoty Pulawy' then 'KS Azoty Puławy'
            when 'Bautista-Agut R.' then 'Bautista Agut, Roberto'
            when 'Belarus' then 'Białoruś'
            when 'Belgium' then 'Belgia'
            when 'Betis' then 'Real Betis'
            when 'Bodoe/Glimt' then 'Bodo/Glimt'
            when 'Bolivia' then 'Boliwia'
            when 'Bosnia & Herzegovina' then 'Bośnia i Hercegowina'
            when 'Brest' then 'Stade Brest 29'
            when 'Broady L.' then 'Broady, Liam'
            when 'Bagnis F.' then 'Bagnis, Facundo'
            when 'Balazs A.' then 'Balazs Attila'
            when 'Carle M L' then 'Carle, Maria Lourdes'
            when 'Carlsen M.' then 'Carlsen, Magnus'
            when 'Caruana F.' then 'Caruana, Fabiano'
            when 'Casa Pia Lisbon' then 'Casa Pia Lizbona'
            when 'Chardy J.' then 'Chardy, Jeremy'
            when 'China' then 'Chiny'
            when 'Chwalińska M.' then 'Chwalińska, Maja'
            when '1. FC Cologne' then 'FC Cologne'
            when 'Colombia' then 'Kolumbia'
            when 'FC Copenhagen' then 'FC Kopenhaga'
            when 'Cornet A.' then 'Cornet, Alize'
            when 'Cyprus' then 'Cypr'
            when 'Cádiz' then 'Cadiz CF'
            when 'Darderi L.' then 'Darderi, Luciano'
            when 'Denmark' then 'Dania'
            when 'Ding L.' then 'Ding, Liren'
            when 'Sz. Donieck' then 'Szachtar Donieck'
            when 'Dortmund' then 'Borussia Dortmund'
            when 'Ecuador' then 'Ekwador'
            when 'Ein. Frankfurt' then 'Eintracht Frankfurt'
            when 'England' then 'Anglia'
            when 'Fernandez L.' then 'Fernandez, Leylah'
            when 'Fett J.' then 'Fett, Jana'
            when 'Finland' then 'Finlandia'
            when 'Flensburg' then 'SG Flensburg-Handewitt'
            when 'Frech, Magdalena' then 'Fręch, Magdalena'
            when 'Fury T.' then 'Fury, Tyson'
            when 'G2' then 'G2 Esports'
            when 'Georgia' then 'Gruzja'
            when 'Germany' then 'Niemcy'
            when 'Glik K.' then 'Glik, Kamil'
            when 'Gonzalez M / Molteni A' then 'Gonzalez, Maximo / Molteni, Andres'
            when 'Greece' then 'Grecja'
            when 'V. Guimaraes' then 'Vitoria Guimaraes'
            when 'Głogów' then 'Chrobry Głogów'
            when 'Hanfmann Y.' then 'Hanfmann, Yannick'
            when 'Hruncakova V.' then 'Hruncakova, Victoria'
            when 'Hsu Y H' then 'Hsu, Yu Hsiou'
            when 'Hungary' then 'Węgry'
            when 'Iceland' then 'Islandia'
            when 'Industria Kielce' then 'Iskra Kielce'
            when 'Ireland' then 'Irlandia'
            when 'Israel' then 'Izrael'
            when 'Basaksehir' then 'Basaksehir Istanbul'
            when 'Istanbul Basaksehir' then 'Basaksehir Istanbul'
            when 'Japan' then 'Japonia'
            when 'KGHM Zaglebie Lubin' then 'Zagłębie Lubin'
            when 'Kazakhstan' then 'Kazachstan'
            when 'Kerhove L.' then 'Kerkhove, Lesley'
            when 'Keymer V.' then 'Keymer, Vincent'
            when 'Kilonia' then 'THW Kiel'
            when 'Korea Płd.' then 'Korea Południowa'
            when 'Kosovo' then 'Kosowo'
            when 'Costa Rica' then 'Kostaryka'
            when 'Kotov P.' then 'Kotov, Pavel'
            when 'Kovacevic A.' then 'Kovacevic, Alexandar'
            when 'Kucova K.' then 'Kucova, Kristina'
            when 'LOSC Lille' then 'Lille OSC'
            when 'Lamens S.' then 'Lamens, Suzan'
            when 'RB Leipzig' then 'RB Lipsk'
            when 'Leverkusen' then 'Bayer Leverkusen'
            when 'Lithuania' then 'Litwa'
            when 'Liu C.' then 'Liu, Claire'
            when 'Sp. Lizbona' then 'Sporting Lizbona'
            when 'LKS Lodz' then 'ŁKS Łódź'
            when 'Lubin' then 'Zagłębie Lubin'
            when 'Luxembourg' then 'Luksemburg'
            when 'Kwidzyn' then 'MMTS Kwidzyn'
            when 'Manch. City' then 'Manchester City'
            when 'Mektic N / Pavic M' then 'Mektic, Nikola / Pavic, Mate'
            when 'Mexico' then 'Meksyk'
            when 'Miedz Legnica' then 'Miedź Legnica'
            when 'Legnica' then 'Miedź Legnica'
            when 'Moldova' then 'Mołdawia'
            when 'Monteiro T.' then 'Monteiro, Thiago'
            when 'Málaga CF' then 'Malaga CF'
            when 'Nakamura H.' then 'Nakamura, Hikaru'
            when 'Netherlands' then 'Holandia'
            when 'North Macedonia' then 'Macedonia Północna'
            when 'Northern Ireland' then 'Irlandia Północna'
            when 'Olympiacos Piraeus' then 'Olympiakos Pireus'
            when 'PSG [K]' then 'Paris Saint-Germain [K]'
            when 'Paraguay' then 'Paragwaj'
            when 'Pavlyuchenkova A.' then 'Pavlyuchenkova, Anastasia'
            when 'Popyriin A.' then 'Popyrin, Alexei'
            when 'Portugal' then 'Portugalia'
            when 'Projekt Warsaw' then 'Projekt Warszawa'
            when 'MKS Pruszkow' then 'MKS Pruszków'
            when 'RKS Rakow Czestochowa' then 'Raków Częstochowa'
            when 'Ramos A.' then 'Ramos-Vinolas, Albert'
            when 'Republic of Korea' then 'Korea Południowa'
            when 'Resovia Rzeszow' then 'Resovia Rzeszów'
            when 'Rhein Neckar' then 'Rhein-Neckar Lowen'
            when 'Rio Ave' then 'Rio Ave FC'
            when 'Riske A.' then 'Riske-Amritraj, Alison'
            when 'Roger-Vasselin E / Garcia C' then 'Roger-Vasselin, Edouard / Garcia Caroline'
            when 'SZYBKI STRZAŁ (MAX 200 PLN)' then ''
            when 'Ram R / Salisbury J' then 'Ram, Rajeev / Salisbury, Joe'
            when 'Scotland' then 'Szkocja'
            when 'FC Shakhtar Donetsk' then 'Szachtar Donieck'
            when 'Siegemund L.' then 'Siegemund, Laura'
            when 'Siniakova K.' then 'Siniakova, Katerina'
            when 'WKS Slask Wroclaw' then 'Śląsk Wrocław'
            when 'Slavia Prague' then 'Slavia Praga'
            when '1. FC Slovacko Uherske Hradiste' then 'FC Slovacko Uherske Hradiste'
            when 'Slovakia' then 'Słowacja'
            when 'Ram R / Sock J' then 'Ram, Rajeev / Sock, Jack'
            when 'Stevanovic N.' then 'Stevanovic, Natalija'
            when 'Strycova B.' then 'Strycova, Barbora'
            when 'Sweden' then 'Szwecja'
            when 'Swiatek, Iga' then 'Świątek, Iga'
            when 'Switzerland' then 'Szwajcaria'
            when 'Tan H.' then 'Tan, Harmony'
            when 'SK Telecom T1' then 'T1'
            when 'Thailand' then 'Tajlandia'
            when 'Tien L.' then 'Tien Learner'
            when 'ThSV Eisenach' then 'Eisenach'
            when 'Tomova V.' then 'Tomova, Wiktorija'
            when 'Sp. Trnava' then 'Spartak Trnava'
            when 'Tunisia' then 'Tunezja'
            when 'Turkey' then 'Turcja'
            when 'Turkiye' then 'Turcja'
            when 'Ukraine' then 'Ukraina'
            when 'Uruguay' then 'Urugwaj'
            when 'Vachier-Lagrave M.' then 'Vachier-Lagrave, Maxime'
            when 'Wales' then 'Walia'
            when 'Watanuki Y.' then 'Watanuki, Yosuke'
            when 'Zabrze' then 'Górnik Zabrze'
            when 'RK Zagrzeb' then 'PPD Zagreb'
            when 'Zeppieri G.' then 'Zeppieri, Giulio'
            when 'Zhang S.' then 'Zhang, Shuai'
            when 'Zhu L.' then 'Zhu, Lin'
            when 'MKS Znicz Pruszkow' then 'MKS Znicz Pruszków'
            when 'co najmniej 1 VAR sędziego głównego przy monitorze' then ''
            when 'G. Łęczna' then 'Górnik Łęczna'
            when 'Świderski K.' then 'Świderski, Karol'
            when 'Świątek I.' then 'Świątek, Iga'
            when 'Chisora D.' then 'Chisora, Dereck'
            when 'Glasspool L / Heliovaara H' then 'Glasspool, Lloyd / Heliovaara Harri'
            when 'de Jong J.' then 'de Jong, Jesper'
            when 'Yemen' then 'Jemen'

            else `druzyna/zawodnik`
        end as ujednolicona_nazwa,
        dyscyplina,
        data_zaladowania
    from
        source
    join
        pojedyncze_nazwy
    using
        (pierwsze_dluzsze_slowo)
    where
        data_zaladowania <= TO_TIMESTAMP('2025-11-01T16:51:42+00:00') --data pierwszego zaladowania
    order by 
        pierwsze_dluzsze_slowo
),

final as (
    select
        `druzyna/zawodnik`,
        ujednolicona_nazwa
    from
        ujednolicone_nazwy
)

select * from final