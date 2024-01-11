<!DOCTYPE html>

<html lang="pl-PL">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <?php echo $css;?> 
    <?php echo $js;?>
    <title>Bartosz Konopka - Optyka w aparatach fotograficznych</title>
</head>

<body onLoad="animation_values();">

    <div class="options_box">
        <div class="options_box_under">
            <a href="index.php">Strona główna</a>
        </div>
        <div class="options_box_under">
            <a href="#animation_box">Animacja</a>
        </div>
        <div class="options_box_under">
            <a href="#information_box">Opis zagadnienia</a>
        </div>
        <div class="options_box_under">
            <a href="index.php?action=register">Rejestracja</a>
        </div>
        <div class="options_box_under">
            <a href="index.php?action=login">Logowanie</a>
        </div>
        <div class="options_box_under">
            <a href="index.php?action=panel">Panel użytkownika</a>
        </div>
    </div>

    <div class="main_header">
            <h1>
                <span class="first_header_text">Bartosz Konopka</span>
            </h1>
            <h2>
                <span class="second_header_text">Techniki Internetowe - Projekt</span>
            </h2>
            <h3>
                <span class="second_header_text">Optyka w aparatach fotograficznych</span>
            </h3>
    </div>

    <div id="animation_box">
        <canvas id="animation_canvas" width="900" height="600">
            
        </canvas>

        <div class="animation_text">
            Dobierz ilość zewnętrznego światła, a do niej współczynniki aparatu (ISO, czas otwarcia migawki
            oraz szerokość przesłony), aby światło zostało prawidłowo odebrane przez aparat (lampka na animacji 
            powinna zaświecić się na zielono).
            <br>
            Zakres ilości wpadającego światła: 1-10
            <br>
            Zakres iso: 50-400
            <br>
            Zakres czasu otwarcia migawki: 8-1000
            <br>
            Zakres szerokości przesłony: 1.7-8
            <br>
            wynik = 10 * (zewnetrzne_swiatlo + 5) * iso/50 * 1/(czas_migawki/100) * szerokość_przesłony
            <br>
            wynik powinien zawierać się w wartości pomiędzy 1000 a 3000 
        </div>
        <div class="animation_form">
            <form name="animation">
                <table style="margin-left: auto;margin-right: auto;">
                    <tr>
                        <th><label for="zewnetrzne_swiatlo">Ilość wpadającego światła:</label></th>
                        <th><input type="text" name="zewnetrzne_swiatlo" id="zewnetrzne_swiatlo" value=""></th>
                    </tr>
                    <tr>
                        <th><label for="iso">ISO:</label></th>
                        <th><input type="text" name="iso" id="iso" value=""></th>
                    </tr>
                    <tr>
                        <th><label for="time">Czas migawki:</label></th>
                        <th><input type="text" name="time" id="time" value=""></th>
                    </tr>
                    <tr>
                        <th><label for="f">Szerokość przesłony:</label></th>
                        <th><input type="text" name="f" id="f" value=""></th>
                    </tr>
                </table>
                <br>
                <input type="button" value="Wykonaj animację" onclick="aanimation()">
            </form>
        </div>
        
        <div id="response_animation">
            
        </div>

    </div>

    <div id="information_box">
        <div class="information_header">
            Optyka
        </div>

            <div class="information_text_middle">
                Optyka to dział fizyki, zajmujący się badaniem natury światła, prawami opisującymi jego emisję, 
                rozchodzenie się, oddziaływanie z materią oraz pochłanianie przez materię. Optyka opracowała specyficzne metody,
                pierwotnie przeznaczone do badania światła widzialnego, obecnie również stosowane do analizy rozchodzenia się innych 
                zakresów promieniowania elektromagnetycznego, takich jak podczerwień i ultrafiolet, nazywane światłem niewidzialnym.
            </div>

            <div class="information_text_middle">
                Prędkość światła w próżni (oznaczana jako <p style="color:rgb(186, 94, 103); display:inline;">c</p>) 
                jest jedną z podstawowych stałych fizycznych. 
                W miarę zwiększania dokładności pomiarów prędkości światła stwierdzono, że różni obserwatorzy, nawet ci 
                poruszający się z dużymi prędkościami względem siebie, rejestrują tę samą wartość prędkości światła. 
                Natomiast w ośrodkach materialnych prędkość światła zmienia się w ściśle określony sposób, zależny od właściwości 
                danego ośrodka.
            </div>

            <div class="information_text_middle">
                Obecnie prędkość światła jest określona z bardzo dużą dokładnością. Prędkość światła w próżni 
                <p style="color:rgb(186, 94, 103); display:inline;">(c)</p> 
                jest tak istotną wielkością, że uznaje się ją za jedną z podstawowych stałych fizycznych. Jej dokładna wartość wynosi:
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mo>c=2,99792458⋅108</mo><mfrac><mn>m</mn><mn>s</mn></mfrac><mo>≈3⋅108</mo><mfrac><mn>m</mn><mn>s</mn></mfrac>
                </math>
                <br>
            </div>

            <div class="information_text_middle">
                Prędkość światła w ośrodku materialnym jest mniejsza niż w próżni, ponieważ światło oddziałuje z atomami w 
                danym ośrodku. Prędkość światła zależy silnie od rodzaju ośrodka, ponieważ jego oddziaływanie z materią zmienia
                się w zależności od różnych atomów, sieci krystalicznych i innych struktur. Można zdefiniować stałą materiałową, 
                opisującą prędkość światła w danym ośrodku, jako współczynnik załamania 
                <p style="color:rgb(186, 94, 103); display:inline;">n</p>, gdzie 
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mo>n=</mo><mfrac><mn>c</mn><mn>v</mn></mfrac>
                </math>
                <br>
                a <p style="color:rgb(186, 94, 103); display:inline;">v</p> to prędkość światła w 
                danym ośrodku.
            </div>

            <div class="information_text_middle">
                Zasada odbicia mówi, że kąt odbicia jest równy kątowi padania:
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mo>θo=θp</mo>
                </math>
                <br>
            </div>

            <div class="information_text_middle">
                Zmiana kierunku promienia światła towarzysząca przejściu do innego ośrodka zależy zarówno od kąta padania, 
                jak i wartości, o jaką zmienia się prędkość światła. Dla promienia światła o określonym kącie padania duża zmiana 
                prędkości światła w ośrodku powoduje dużą zmianę kąta załamania. Prawo załamania światła, znane również jako prawo Snella, 
                przyjmuje postać:
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mo>n1*sinθ1=n2*sinθ2</mo>
                </math>
                <br>
            </div>

        <div class="information_header">
            Optyka geometryczna
        </div>

            <div class="information_text_middle">
                Najstarszą i fundamentalną dziedziną optyki jest optyka geometryczna, która do dziś stanowi podstawę tej dziedziny. 
                Kluczowym pojęciem w optyce geometrycznej jest promień świetlny, czyli nieskończenie cienka wiązka światła 
                (odpowiednik prostej w geometrii). W tym kontekście rozchodzenie się światła opisywane jest jako bieg promieni, 
                bez zagłębiania się w samą naturę światła. Zgodnie z założeniami optyki geometrycznej, światło propaguje się w ośrodkach 
                jednorodnych po linii prostej, a na granicy między ośrodkami zachodzi zjawisko odbicia lub załamania światła. 
                Proces załamywania światła jest szczegółowo badany w ramach dziedziny zwaną dioptryką.
            </div>

        <div class="information_header">
            Obrazy tworzone przez zwierciadła płaskie
        </div>

            <div class="information_text_middle">
                Obrazy powstające w zwierciadle płaskim charakteryzują się tym, że są tej samej wielkości co przedmiot. 
                Dodatkowo, umiejscowione są za zwierciadłem i zorientowane tak samo jak przedmiot.
            </div>

            <div class="information_photo_middle">
                <img src="src/view/photos/1.jpg" alt="zwierciadlo_plaskie">
            </div>

            <div class="information_text_middle">
                Analizując dwa promienie światła wychodzące z punktu <p style="color:rgb(186, 94, 103);display:inline;">P</p>
                , można zauważyć, że po odbiciu od zwierciadła płaskiego 
                wpadają one do oka obserwatora. Te odbite promienie podlegają prawu odbicia, co oznacza, że kierunek ich ruchu 
                jest zgodny z tym prawem. W efekcie odbicia, obserwujemy, że promienie te wydają się wychodzić z punktu 
                <p style="color:rgb(186, 94, 103);display:inline;">Q</p> za zwierciadłem, 
                przecinając się przedłużeniem odbitych promieni. Punkt <p style="color:rgb(186, 94, 103);display:inline;">Q</p> 
                staje się zatem pozornym miejscem, gdzie znajduje się obraz 
                punktu <p style="color:rgb(186, 94, 103);display:inline;">P</p>.
            <br>
                Podobnie, powtarzając tę konstrukcję dla punktu <p style="color:rgb(186, 94, 103);display:inline;">P′</p>, 
                otrzymujemy obraz punktu <p style="color:rgb(186, 94, 103);display:inline;">Q′</p>. Warto zaznaczyć, że wysokość 
                obrazu jest identyczna jak wysokość przedmiotu, obraz jest prosty, a odległość między przedmiotem a zwierciadłem 
                <p style="color:rgb(186, 94, 103);display:inline;">(dp)</p> jest 
                równa odległości między obrazem a zwierciadłem <p style="color:rgb(186, 94, 103);display:inline;">(do)</p>.
            </div>

        <div class="information_header">
            Zwierciadła sferyczne
        </div>
            
            <div class="information_text_middle">
                Obraz tworzony przez zwierciadło płaskie charakteryzuje się tym, że ma takie same rozmiary jak przedmiot, 
                jest równoległy i znajduje się w tej samej odległości za zwierciadłem, co przedmiot przed nim. W przypadku zwierciadeł 
                zakrzywionych, mogą one tworzyć obrazy mniejsze lub większe niż przedmiot, a także mogą być umiejscowione przed lub za 
                zwierciadłem.
            </div>
            
            <div class="information_text_middle">
                Wyróżniamy dwa podstawowe typy zwierciadeł sferycznych. Zwierciadło sferyczne wypukłe posiada zewnętrzną powierzchnię 
                kuli, natomiast zwierciadło sferyczne wklęsłe ma wewnętrzną powierzchnię sfery.
            </div>

            <div class="information_photo_middle">
                <img src="src/view/photos/2.jpg" alt="zwierciadlo_zakrzywione">
            </div>
            
            <div class="information_text_middle">
                Symetria odgrywa istotną rolę w wielu układach optycznych, obejmując również zwierciadła i soczewki. 
                Oś symetrii tych elementów optycznych nazywana jest często osią główną lub osią optyczną.
                W przypadku zwierciadła sferycznego, oś optyczna przechodzi przez środek krzywizny zwierciadła i jego wierzchołek.
            </div>

            <div class="information_photo_middle">
                <img src="src/view/photos/3.jpg" alt="zwierciadlo_zakrzywione_odbicie">
            </div>

            <div class="information_text_middle">
                Rysunek (a) przedstawia równoległe promienie odbite od zwierciadła parabolicznego, przecinające się w jednym punkcie 
                <p style="color:rgb(186, 94, 103);display:inline;">F</p>,
                nazywanym ogniskiem. Rysunek (b) pokazuje, że równoległe promienie biegnące blisko osi optycznej i te w znacznej 
                odległości od niej po odbiciu od zwierciadła sferycznego nie przecinają się w jednym punkcie. Natomiast rysunek (c) 
                przedstawia, że dla promieni równoległych biegnących blisko osi optycznej krzywizna zwierciadła jest dobrym 
                przybliżeniem paraboli, co skutkuje przecięciem się promieni w jednym punkcie.
            </div>

            <div class="information_photo_middle">
                <img src="src/view/photos/4.jpg" alt="zwierciadlo_wypukle_odbicie">
            </div>

            <div class="information_text_middle">
                Rysunek (a) ilustruje promienie odbite przez zwierciadło sferyczne wypukłe. 
                Promienie światła biegnące równolegle do osi optycznej zostają odbite od zwierciadła sferycznego wypukłego i 
                wydają się wychodzić z ogniska leżącego w odległości równej ogniskowej 
                <p style="color:rgb(186, 94, 103);display:inline;">f</p>, po przeciwnej stronie zwierciadła. 
                To ognisko jest pozorne, ponieważ żadne rzeczywiste promienie z tego ogniska nie wychodzą. Rysunek (b) przedstawia 
                obraz pozorny utworzony przez zwierciadło wypukłe.
            </div>

            <div class="information_text_middle">
                W przybliżeniu małych kątów, ogniskowa f zwierciadła sferycznego wklęsłego jest równa połowie jego promienia krzywizny, 
                <p style="color:rgb(186, 94, 103);display:inline;">R</p>
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mo>f=</mo><mfrac><mn>R</mn><mn>2</mn></mfrac>
                </math>
                <br>
            </div>

            <div class="information_text_middle">
                Równanie zwierciadła opisuje zależność pomiędzy odległościami obrazu 
                <p style="color:rgb(186, 94, 103);display:inline;">(do)</p> i przedmiotu 
                <p style="color:rgb(186, 94, 103);display:inline;">(dp)</p> a długością ogniskowej 
                <p style="color:rgb(186, 94, 103);display:inline;">(f)</p>:
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mfrac><mn>1</mn><mn>dp</mn></mfrac><mo>+</mo><mfrac><mn>1</mn><mn>do</mn></mfrac>
                    <mo>=</mo><mfrac><mn>1</mn><mn>f</mn></mfrac>
                </math>
                <br>
            </div>

            <div class="information_text_middle">
                To równanie jest poprawne jedynie w przybliżeniu małych kątów i, mimo że zostało wyprowadzone dla zwierciadła wklęsłego, 
                stosuje się je również dla zwierciadeł wypukłych.
            </div>

            <div class="information_text_middle">
                Bezwymiarowe powiększenie liniowe, oznaczane jako p, opisuje stosunek wysokości obrazu 
                <p style="color:rgb(186, 94, 103);display:inline;">(ho)</p> do 
                wysokości przedmiotu <p style="color:rgb(186, 94, 103);display:inline;">(hp)</p> i jest definiowane jako:
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mo>p=</mo><mfrac><mn>ho</mn><mn>hp</mn></mfrac><mo>=-</mo><mfrac><mn>do</mn><mn>dp</mn></mfrac>
                </math>
                <br>
                Gdy <p style="color:rgb(186, 94, 103);display:inline;">p</p> 
                jest dodatnie, obraz jest prosty, a gdy 
                <p style="color:rgb(186, 94, 103);display:inline;">p</p> jest ujemne, obraz jest odwrócony. Jeżeli 
                <p style="color:rgb(186, 94, 103);display:inline;">|p| > 1</p>, 
                obraz jest większy niż przedmiot, a jeżeli 
                <p style="color:rgb(186, 94, 103);display:inline;">|p| &lt; 1</p>, obraz jest mniejszy niż przedmiot.
            </div>

        <div class="information_header">
            Cienkie soczewki
        </div>

            <div class="information_photo_middle">
                <img src="src/view/photos/5.jpg" alt="soczewki">
            </div>

            <div class="information_text_middle">
                Soczewki są powszechnie wykorzystywane w różnych układach optycznych, takich jak zwykłe szkła powiększające, 
                aparaty fotograficzne czy ludzkie oko. Słowo "soczewka" wywodzi się od łacińskiego terminu "lenticula", 
                odnoszącego się do ziarna soczewicy, której kształt jest podobny do soczewki wypukłej. Warto zaznaczyć, 
                że nie wszystkie soczewki mają jednakowy kształt. Powyższa ilustracja przedstawia różnorodność ich kształtów. 
                Terminologia używana do opisu soczewek jest zbliżona do tej stosowanej przy opisie zwierciadeł sferycznych. 
                Oś symetrii soczewki określana jest jako oś optyczna, a punkt, w którym oś optyczna przecina powierzchnię soczewki, 
                nosi nazwę wierzchołka soczewki, i tak dalej.
            </div>

            <div class="information_photo_middle">
                <img src="src/view/photos/6.jpg" alt="soczewki_odbicie">
            </div>

            <div class="information_text_middle">
                Równoległe do osi optycznej promienie światła, padające na soczewkę skupiającą (a), są zbierane w ognisku 
                <p style="color:rgb(186, 94, 103);display:inline;">F</p>. 
                W przypadku soczewki rozpraszającej (b), są one rozbieżne, a przedłużenia promieni rozbieżnych przecinają się w 
                punkcie, który jest ogniskiem pozornym soczewki. Odległość od środka soczewki do jej ogniska nazywana jest ogniskową
                soczewki <p style="color:rgb(186, 94, 103);display:inline;">f</p>.
            </div>

            <div class="information_text_middle">
                Podobnie jak w przypadku zwierciadeł sferycznych, możemy wykorzystać zależność wynikającą z konstrukcji biegu promieni, 
                aby pokazać, że dla cienkich soczewek spełnione jest równanie:
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mfrac><mn>1</mn><mn>dp</mn></mfrac><mo>+</mo><mfrac><mn>1</mn><mn>do</mn></mfrac>
                    <mo>=</mo><mfrac><mn>1</mn><mn>f</mn></mfrac>
                </math>
                <br>
                gdzie f to ogniskowa cienkiej soczewki. Przy odpowiednich założeniach możemy również uzyskać wzór:
                <br>
                <math style="color:rgb(186, 94, 103);">
                    <mfrac><mn>1</mn><mn>f</mn></mfrac>
                    <mo>=(</mo>
                    <mfrac><mn>n2</mn><mn>n1</mn></mfrac>
                    <mo>−1)(</mo>
                    <mfrac><mn>1</mn><mn>R1</mn></mfrac>
                    <mo>−</mo>
                    <mfrac><mn>1</mn><mn>R2</mn></mfrac>
                    <mo>)</mo>
                </math>
                <br>
                Jest to postać równania soczewki cienkiej, znana jako równanie producentów soczewek.
            </div>

            <div class="information_photo_middle">
                <video width="500" height="280" controls>
                    <source src="src/view/photos/movie.mp4" type="video/mp4">
                </video>
                <br>
                <a href="https://www.youtube.com/watch?v=EL9J3Km6wxI&ab_channel=CanonImagingAsia">
                    https://www.youtube.com/watch?v=EL9J3Km6wxI&ab_channel=CanonImagingAsia
                </a>
            </div>

        <div class="information_header">
            Aparat fotograficzny
        </div>

            <div class="information_text_middle">
                Aparaty fotograficzne są powszechnie używane na co dzień. W latach 1825–1827 francuski 
                wynalazca Joseph Niépce (1765–1833) z powodzeniem utrwalał obrazy przy użyciu swojego prymitywnego 
                aparatu. Od tamtej pory nastąpił ogromny postęp w dziedzinie aparatów fotograficznych i detektorów 
                wykorzystujących zapis fotograficzny. Na początku fotografie były utrwalane przy użyciu reakcji światłoczułych 
                związków srebra, takich jak chlorek srebra lub bromek srebra. Powszechnie stosowany był papier fotograficzny 
                zawierający związki srebra, aż do momentu pojawienia się fotografii cyfrowej w latach 80. XX wieku, opartej na 
                detekcji obrazów przez matrycę CCD. CCD to układ światłoczułych elementów półprzewodnikowych, zwanych pikselami. 
                Każdy piksel reaguje wyłącznie na intensywność światła, ale zastosowanie filtrów barwnych (w kolorach podstawowych: 
                czerwonym, zielonym i niebieskim) pozwala uzyskać kolorowe obrazy cyfrowe.
            </div>

            <div class="information_text_middle">
                Oczywiście elektronika stanowi kluczową część aparatu cyfrowego, jednakże fizyczną podstawą działania każdego 
                aparatu fotograficznego jest optyka. W praktyce układ optyczny aparatu fotograficznego można traktować jak 
                pojedynczą soczewkę, przy czym przedmiot znajduje się w odległości znacznie większej niż ogniskowa soczewki.
            </div>  

            <div class="information_photo_middle">
                <img src="src/view/photos/7.jpg" alt="aparat">
            </div>
        
        <div class="information_header">
            Dziękuję za uwagę
        </div>
    </div>

    <div class="footer">
        <div class="footer_text">
            <span class="footer_text">Bartosz Konopka - Techniki Internetowe - Projekt</span>
        </div>
    </div>
</body>
</html>