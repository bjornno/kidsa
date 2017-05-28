Lære unga å sende og motta krypterte meldinger på en enkel måte

Først start mottaker i et eget vindu.

`ruby client/motta.rb`

Denne vil stå og polle et api for nye meldinger og skrive dem ut.

Deretter skal ungene skrive innholdet i client/send.rb

De kan bruke en metode importert fra communication.rb som heter send_melding(mottaker, avsender, melding, kryptert?)

De kan også bruke en metode som heter krypter(krypteringskode, melding)

1. send en melding og se den dukke opp hos den andre (bruk send_melding metoden)
2. lag et program hvor man kan skrive inn meldingen (hint gets)
3. lag et program hvor man kan sende flere meldinger (hint while)
4. Vis at meldingene kan avlyttes (http://krypto-meldinger.herokuapp.com/<navn>)
5. send krypterte meldinger (kan bruke krypter metoden, eller lage den selv. Prøv med flere varianter av kode)
6. Vis hvordan meldingene ser ut kryptert (http://krypto-meldinger.herokuapp.com/<navn>)
7. vise hvordan man likevel kan "hacke" dette og dekryptere uten å kjenne nøkkelen (hint frekvensen av bokstaver i norsk (let etter bokstaven e))


Kryptering

Når dere sender meldinger, kan jeg se hva dere sender til hverandre.
Vi skal bruke en kryptering som heter Caesar cipher, etter Julius Caesar, som brukte den 
til å sende kodete meldinger til militæret.