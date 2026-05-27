# Casus-reuma-Esm-e

Reuma



- Inleiding: +- 200 woorden met aanleiding, achtergrondinformatie en doelstel-
ling. Bronnen (PDF) kunnen in een aparte folder met verwijzing.
- Methode: +- 200 woorden met methode, flowschema. Zie leerdoelen voor mi-
nimale inhoud. Scripts, data etc. kunnen in een aparte folder met verwijzing.
- Resultaten: +- 200 woorden, inclusief correcte verwijzingen.
- Conclusie: +- 200 woorden, inclusief aanbevelingen en onderzoek in context
plaatsen.
- Uitleg competentie beheren (zie voor hulpvragen het voorbeeld):
o File (bijvoorbeeld een md file) met uitleg over Data Stewardship
o File met uitleg over toepassing beheren met GitHu
___

**Inleiding**
---

Reumatoïde Artritis (RA) is een auto-immuunziekte die 0,3-1% van de wereldbevolking krijgt en 2-3 keer vaker bij vrouwen voorkomt dan bij mannen. (Bron 1)
Patiënten ervaren vaak pijn, stijfheid en zwelling in meerdere gewrichten, vaak aan beide kanten van het lichaam. (Bron 2)
Er is geen duidelijke oorzaak, geen uniform ziekteverloop en er bestaat momenteel geen genezende behandeling. (Bron 1) 
Wel zijn er behandelingen die het proces kunnen remmen (bron 3).
Omdat er nog zo veel onduidelijk is over RA is er behoeft aan een beter beeld van deze ziekte. Dit wordt in dit onderzoek gedaan door te kijken naar het verschil in genexpressie tussen de patiënten met RA en de controlegroep. Ook wordt er gekeken naar welke pathways een belangrijke rol spelen in het proces van RA.

In dit onderzoek wordt er dan ook antwoord gegeven op de vraag: …


**Methode**
---

In dit onderzoek wordt gebruik gemaakt van samples van 4 mensen met RA en 4 mensen zonder RA, genomen uit synoviaal weefsel (weefsel dat de binnenkant van gewrichten bekleed). De reads zijn afkomstig uit een eerder onderzoek waarin ze gesequenced hebben via RNA-seq.(bron 1)

Met de (genexpressie) van deze (patiënten) kan er een pathway worden gemaakt waarin duidelijk het verschil te zien is tussen patiënten met RA en de controlegroep.

De eerste stap in het proces is het indexeren van de reads, deze stap is niet noodzakelijk maar scheelt wel tijd. Vervolgens worden de reads gemapt (zie [indexeren+mappen](scripts/indexeren%20%2B%20mappen.R)).
Tijdens het mappen worden de reads op de juiste positie in het referentiegenoom geplaatst. 
Na het mappen wordt er een count matrix gemaakt (zie [count matrix](scripts/count%20matrix.R)), hierin staat hoeveel reads er per gen zijn geteld voor elk monster. 
Vervolgens is er een metadata tabel gemaakt waarin staat wat de condities zijn per monster. zie… 
Daarna is er een differentiële genexpressie analyse uitgevoerd met DESeq2 om te bepalen of de genexpressie statistisch significant verschilt tussen de controlegroep en de groep met RA. Zie… . De resultaten hiervan zijn gevisualiseerd in een vulcano plot. Zie figuur…




Indexeren?
Mappen
Count matrix
Metadata?
Statistiek?
Vulcanoplot?
…
Go analyse
Pathway

