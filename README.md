[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/KIFSD5kr)
# Devops blog

Schrijf je devops blog in het bestand `src/dev-blog-name-in-kebab-case/README.md`.
Schrijf je onderzoeksplan in `src/onderzoeksplan.md`

Om te testen hoe je blog eruit testen binnen [mdbook](https://rust-lang.github.io/mdBook/) zonder zelf mdbook te installeren kun je bijgevoegde Docker file gebruiken.

Zorg dus dat je Docker hebt geinstalleerd, bijvoorbeeld via [Docker Desktop voor Windows](https://docs.docker.com/desktop/install/windows-install/) of macOS. Voor het gemak is er ook een bash script `build`. Deze moet je wellicht eenmalig `chmod +x mdbook-build`. En run je daarna met:

```console
./build
```

Of als je zelf Docker wilt gebruiken dan run je:

```console
docker build -t devops-blog-image .
docker run --name devops-blog-container -d -p 8081:80 devops-blog-image

# We hebben de image en container hierboven `devops-blog` genoemd, omdat dit het makkelijker maakt om de app opnieuw te starten na het veranderen/repareren van iets.
# Om de app opnieuw te starten moet je de container eerst stoppen en verwijderen. En een naam is korter dan het opzoeken van willekeurige namen of hashes die Docker aanmaakt.
# docker stop devops-blog-container
# docker rm devops-blog-container
```
