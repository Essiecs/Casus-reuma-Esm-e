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

In dit onderzoek wordt er dan ook antwoord gegeven op de vraag: welke genen komen meer of minder tot expressie bij mensen met reumatoïde artritis, en welke metabole routes functioneren anders?


**Methode**
---

In dit onderzoek wordt gebruik gemaakt van samples van 4 mensen met RA en 4 mensen zonder RA, genomen uit synoviaal weefsel (weefsel dat de binnenkant van gewrichten bekleed). De reads zijn afkomstig uit een eerder onderzoek waarin ze gesequenced hebben via RNA-seq.(bron 1)

Met de (genexpressie) van deze (patiënten) kan er een pathway worden gemaakt waarin duidelijk het verschil te zien is tussen patiënten met RA en de controlegroep.

De eerste stap is het indexeren van de reads, deze stap is niet noodzakelijk maar scheelt wel tijd. Vervolgens worden de reads gemapt met [Rsubread](https://academic.oup.com/nar/article/47/8/e47/5345150?luicode=10000011&lfid=231522type%3d1%26t%3d10%26q%3d%23bioinfo%23&u=https%3a%2f%2facademic.oup.com%2fnar%2farticle%2f47%2f8%2fe47%2f5345150&login=false) package (versie 2.26.0)(zie [indexeren+mappen](scripts/indexeren%20%2B%20mappen.R)).
Tijdens het mappen worden de reads op de juiste positie in het referentiegenoom geplaatst. 
Na het mappen wordt er een count matrix gemaakt (zie [count matrix](scripts/count%20matrix.R)), hierin staat hoeveel reads er per gen zijn geteld voor elk monster hiervoor wordt . 
Vervolgens is er een metadata tabel gemaakt waarin staat wat de condities zijn per monster (zie [metadata](scripts/metadata.R)).
Daarna is er een differentiële genexpressie analyse uitgevoerd met [DESeq2](https://cdimage.debian.org/mirror/bioconductor.org/packages/3.3/bioc/vignettes/DESeq2/inst/doc/DESeq2.pdf) (versie 1.52.0) om te bepalen of de genexpressie statistisch significant verschilt tussen de controlegroep en de groep met RA (zie [statistiek](scripts/statistiek.R)). 
Hierna word een GO-analyse uitgevoerd met de [goseq]( https://ftp.acc.umu.se/mirror/bioconductor.org/packages/3.8/bioc/vignettes/goseq/inst/doc/goseq.pdf) package (versie 1.64.0)(zie [GO-analyse](scripts/GO-analyse.R)).
Hiermee kan er gezien worden welke biologische processen en functies het meest afwijken in patiënten met RA. Deze informatie helpt bij het kiezen van relevante KEGG-pathways.
Tot slot wordt de gekozen pathway gevisualiseerd (zie [pathway](scripts/pathway.R)).

Flowschema maken
Pathview package er nog inzetten
Juiste versienummer referentiegenoom
Hele script er nog inzetten

Bij resultaten kijken naar gen met meeste verschil denk ik en naar pathway


**Resultaten**
---

Inleiden..
In deze tabel is te zien dat … de hoogste log2FoldChange heeft, … de laagste log2FoldChange en … de laagste p-waarde heeft

In deze vulcano plot zijn de genen met rood aangegeven die een p-waarde hebben van <0,05 en een log2 fold change hebben van kleiner dan -1 en groter dan 1.

In deze staafdiagram is te zien welke go term de kleinste verhouding heeft van …/…. Dit geeft aan dat in die categorie veel genen significant verschillend tot expressie komen in patiënten met RA in vergelijking met de controlegroep, in verhouding tot de hoeveelheid genen die in die categorie zitten. Dit geeft een goede richting aan voor het kiezen van een interessante pathway. 
Uit de GO-analyse bleek het immunoglobulinecomplex (antilichamen) interessant te zijn, wat wijst op verhoogde antistof- en B-celactiviteit. Omdat B-cellen hiervoor afhankelijk zijn van T-helpercellen, en die weer geactiveerd worden via antigeenpresentatie, is gekozen voor de pathway ‘antigen processing and presentation’. Deze pathway is hier te zien:2026









3 kopjes voor beheren
1 is github pagina 
…


Schrijven methode
Belangrijk
- Versienummer van packages 1 keer per package
o Is functie in r voor
o Kan je rechts zien in r
- Verwijzen naar artikel van package (bron)
- Bij gebruiken pipeline ook iets misschien
- Referentie genoom met versienummer?


Transcriptomics in google scholar

pwaarde bespreken


