{% extends "layout.html" %}

{% block body %}

<div class="col-md-10 col-md-offset-1">
 
{% filter markdown() %}

## Návody pre prostredie CHI Data Lab

### Prihlásenie a voľba prostredia

Do prostredia Data Lab sa môžete prihlásiť svojim študentským kontom na TUKE. Po zadaní používateľského mena (v tvare ab123cd) a hesla sa zobrazia nastavenia servera na ktorom budete pracovať. Pre každého študenta sa vytvorí samostatný server. Na výber máte nasledujúce možnosti konfigurácie:

  * _Jupyter Notebook Data Science Stack_ – obsahuje nástroje pre programovanie v jazyku Python a R so zameraním na dátovú analytiku. Toto prostredie zvoľte pre predmet JDA.
  * _Jupyter Notebook Deep Learning Stack_ – obsahuje prostredie TensorFlow pre programovanie metód hlbokého učenia. Toto prostredie zvoľte pre predmet PMAD.
  * _Jupyter Notebook Python Spark Stack_ – obsahuje prostredie pre distribuované výpočty Apache Spark. Toto prostredie zvoľte pre predmet TSVD.

Ak sa chcete prepnúť medzi konfiguráciami:

  1. uložte si Vašu prácu (pozri nasledujúcu časť)
  2. v menu File zvoľte Hub Control Panel
  3. kliknite na tlačidlo Stop My Server, a následne Start My Server
  4. znova sa Vám zobrazia možnosti konfigurácie a pre nový sever sa môžete prepnúť do iného prostredia.

### Hlavné rozhranie

Ako hlavné programátorské rozhranie je prednastavené prostredie [JupyterLab](https://jupyterlab.readthedocs.io/en/latest/). Viac informácií o práci v tomto prostredí nájdete v menu Help > JupyterLab Reference (v angličtine). Ak chcete používať klasické rozhranie [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/), v menu Help zvoľte Launch Classic Notebook.

### Pracovný adresár a zdieľané dáta

Po prihlásení sa spustí samostatný server pre výpočty pre každého používateľa. Tento server je dočasný a automaticky sa odstráni ak na ňom nebudete pracovať nejakú dobu. Ak si chcete trvalo uchovať svoje súbory (notebooky, dáta, atď.), musíte ich uložiť v adresári **work**. V adresári work si môžete vytvoriť aj svoje podadresáre. Všetky ostatné dáta mimo adresára work (vrátane napr. vami nainštalovaných knižníc a balíkov v Pythone, alebo R) môžu byť automaticky vymazané. Adresár work je zdieľaný medzi všetkými konfiguráciami prostredia.

Okrem adresára work máte k dispozícii adresár **datalab**, v ktorom nájdete súbory zdieľané pre jednotlivé cvičenia vašim cvičiacim, alebo prednášajúcim. Adresár datalab je pre Vás iba na čítanie, tzn. môžete napr. v ňom notebooky spustiť, ale ak chcete uložiť nejaké zmeny, musíte ich uložiť ako kópiu do adresára work.
 
### Lokálne prostredie

Server prostredia Data Lab si môžete spustiť aj lokálne na svojom počítači v prostredí Docker. Pre lokálne spustenie servera si najprv nainštalujte prostredie Docker podľa [návodu](https://docs.docker.com/get-docker/) pre Váš operačný systém a zvoľte Docker image pre Data Lab konfiguráciu podľa nasledujúcej tabuľky:

| Konfigurácia prostredia	| Image |
|-------------------------|-------|
|_Jupyter Notebook Data Science Stack_ |	`peterbednar/datascience-notebook:2.3.1`|
|_Jupyter Notebook Deep Learning Stack_	| `peterbednar/tensorflow-notebook:2.3.1`|
|_Jupyter Notebook Python Spark Stack_	| `peterbednar/pyspark-notebook:2.3.1`|

  1.	V príkazovom riadku sa prepnite do adresára na vašom počítači, v ktorom máte lokálne uložené súbory s ktorými chcete pracovať. Tento adresár sa v serveri sprístupní ako Váš pracovný adresár work.
  2.	Spustite server príkazom:
   
   **Windows**
   
   ``docker run -it --rm -v "%cd%":/home/jovyan/work -p 8888:8888 peterbednar/datascience-notebook:2.3.1``
   
   **Linux/macOS**
   
   ``docker run -it --rm -v " ${PWD}":/home/jovyan/work -p 8888:8888 peterbednar/datascience-notebook:2.3.1``
 
  3.	Vo výpise na obrazovke príkazového riadku sa zobrazí adresa URL, prostredníctvom ktorej sa pripojíte k lokálnemu serveru cez Váš prehliadač.

Ak máte grafickú kartu NVidia s podporou CUDA a systém Linux, pre prostredie _Jupyter Notebook Deep Learning Stack_ môžete zvoliť image `peterbednar/tensorflow-gpu-notebook:2.3.1`, v ktorom môžete využiť akceleráciu výpočtov na GPU.


{% endfilter %}

</div>

{% endblock %}
