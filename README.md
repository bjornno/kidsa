Lære unga å sende og motta krypterte meldinger på en enkel måte

Først start mottaker i et eget vindu.

`ruby client/motta.rb`

Denne vil stå og polle et api for nye meldinger og skrive dem ut.

Deretter skal ungene skrive innholdet i client/send.rb

De kan bruke en metode importert fra communication.rb som heter send_melding(mottaker, avsender, melding, kryptert?)

De kan også bruke en metode som heter krypter(krypteringskode, melding)

1. send en melding og se den dukke opp hos den andre
2. lag et program hvor man kan skrive inn meldingen
3. lag et program hvor man kan sende flere meldinger
4. send krypterte meldinger
5. vise hvordan man kan "hacke" dette og dekryptere uten å kjenne nøkkelen 


Kryptering

Når dere sender meldinger, kan jeg se hva dere sender til hverandre.
Vi skal bruke en kryptering som heter Caesar cipher, etter Julius Caesar, som brukte den 
til å sende kodete meldinger til militæret.