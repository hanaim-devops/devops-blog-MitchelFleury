## Wat is Prometheus?

Prometheus is een open-source systems monitoring en alerting toolkit die origineel ontwikkeld is door SoundCloud. Inmiddels is Prometheus een opzichzelf staand project dat sinds 2016 op CNCF staat ([Overview](https://prometheus.io/docs/introduction/overview/)). 

### Features
Deze tool slaat de data op als 'time series data', dus de data met daarbij ook de timestamp. 'Time series' is een reeks aan data die op basis van tijd wordt gesorteerd ([Time series](https://en.wikipedia.org/wiki/Time_series)). Dit kan het makkelijker maken om grafieken op basis van tijd te maken.

PromQL (Prometheus Query Langue) is een eigen query taal van Prometheus om data te kunnen ophalen. De resultaten van een query worden weergegeven in een grafiek, een gegevenstabel of kunnen worden opgehaald via een HTTP API ([PromQL](https://prometheus.io/docs/prometheus/latest/querying/basics/)).

Elke prometheus server heeft zijn eigen data en is zelfstandig. Dit brengt zijn voordelen mee zoals betrouwbaarheid (als een andere node weg valt blijft deze draaien) en schaalbaarheid door replicatie. Maar dit brengt ook een nadeel met zich mee, omdat het geen gedistributeerde opslag ondersteunt. Hier zou je een andere tool voor moeten gebruiken (bijv Thanos) (bron CHAT).

Prometheus gebruikt een pull model dat data ophaalt via HTTP. Een pull model maakt het onder andere mogelijk om een centrale plek te hebben voor configuratie ([Pull model](https://signoz.io/guides/is-prometheus-monitoring-push-or-pull/)). 

### Belangrijkste termen

- Prometheus server: Dit is de kern van het systeem. Het haalt metrics op, slaat ze op en biedt de mogelijkheid om queries uit te voeren via PromQL ([server](https://www.tigera.io/learn/guides/prometheus-monitoring/#:~:text=Prometheus%20is%20an%20open%2Dsource,are%20optional%20key%2Dvalue%20pairs.)).
- Exporter: Is een kleine applicatie die runt naast de applicatie waar je data van wilt ophalen. De exporter maakt de data beschikbaar, vaak moet de data nog wel worden omgezet naar een formaat dat Prometheus ondersteunt ([Glossary](https://prometheus.io/docs/introduction/glossary/)).
- Alertmanager: Verwerkt alerts en verstuurd dan meldingen naar een platform naar keuze (bijv slack).

Prometheus heeft een eigen ([glossary](https://prometheus.io/docs/introduction/glossary/)) waar je nog meer termen kan vinden.

## Architectuur
Nu we weten wat Prometheus is en wat het doet vraag ik me af hoe het werkt. 