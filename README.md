# Bodega Battle

## Wymagania 

✅ - Robimy
❔ - Może robimy
❌ - Nie robimy

### Ogólne

- [x] Obsługa klawiatury (np. ruch, atak, skok) ✅ -> bindy na przyciski pod elementy ui 
- [x] Obsługa myszki (kliknięcia, przeciąganie, celowanie) ✅
- [x] Wykrywanie kolizji między obiektami ✅
- [ ] Możliwość sterowania więcej niż jedną postacią❔-> no jakby wysyłamy unity czy to się liczy jako sterowanie więcej niż jedną postacią? według mnie tak.
- [ ] Tryb multiplayer lokalny (np. dwóch graczy na jednej klawiaturze) ❌ -> tu raczej nie widzę opcji dla tower defefense fajny byłby tryb vs. ale musiał nie da się go zrobić in real time bez obsługi kontrolera, ewentualnie turn based i tylko wysyłasz unity klawiaturą ale brzmi jak za dużo roboty 
- [x] Wybór postaci lub pojazdu przed grą ✅-> raczej nie ew. coś w stylu 2 postacie jedna dostaje więcej kasy ale ma mniej hp; albo 2 layouty planszy na której się bronisz jeden

### Logika gry

- [x] System punktacji ✅ ->  np. `1000 - czas * stracone_hp`
- [x] System żyć lub pasków energii ✅ -> hp
- [x] Przeciwnicy z prostą AI (np. patrolowanie, pogoń, unikanie) ✅ -> najemnicy nasyłani przez przeciwnika 
- [x] Ulepszenia/bronie/power-upy ✅ -> najemnicy / fortyfikacje 
- [ ] Zbieranie przedmiotów (np. monety, klucze) ✅ -> myśle ze można to podciągnąć pod automat i zabieranie coinów od przecinika 
- [ ] Mechanika levelowania (np. coraz trudniejsi przeciwnicy) ✅ -> czas -> ai losuje więcej trudniejszych przeciwników 
- [ ] Ograniczenie czasowe (odliczanie, czas na wykonanie zadania) ❔-> razem z System osiągnięć 
- [ ] Proceduralne generowanie plansz (np. losowe rozmieszczenie przeszkód) -> losowy layout sklepu przeciwnika ✅
- [ ] System osiągnięć (np. „zbierz wszystkie gwiazdki”) ❔ -> ewentualnie coś w stylu ograniczeń czasowych: złoty/ srebrny/ bronz medal 
- [ ] Zagadki logiczne lub łamigłówki ❌
- [x] System ekonomii (np. waluta, sklep, zakupy) ✅

### Grafika i animacja

- [x] Animacje ruchu postaci (chód, skok, atak) -> bez skoku ✅
- [x] Efekty specjalne (np. eksplozje, błyski, cienie) -> chmura / wybuch habusz ✅
- [x] Interfejs użytkownika (UI): licznik punktów, pasek życia itp. ✅

### Dźwięk i muzyka

- [x] Muzyka w tle -> jeden track przez cała gre ✅
- [x] Efekty dźwiękowe (skoki, uderzenia, wybuchy) -> stock z neta ✅
- [x] Różne dźwięki w zależności od sytuacji (np. inna muzyka w menu) -> muzyka ścisza się jeśli przegrasz ✅
- [x] Możliwość włączenia/wyłączenia dźwięku -> przycisk w menu ✅
- [x] Dynamiczne zmiany muzyki (np. podczas walki) ✅ 

### Struktura gry

- [x] Ekran powitalny z tytułem gry ✅
- [x] Menu główne (start, instrukcja, wyjście) ✅
- [x] Instrukcja lub samouczek w grze -> ekran z tekstem i ikonkami po starcie ✅
- [ ] Ekran wygranej i przegranej ✅
- [x] Możliwość restartu gry ✅
- [x] Wybór poziomu trudności ✅
- [x] Przechowywanie stanu gry (np. zapis do pliku) ?
- [x] Ekran pauzy ✅
