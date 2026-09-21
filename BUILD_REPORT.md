# BUILD_REPORT — Statistica II / Introduzione alla Statistica Computazionale

Report finale di costruzione del libro Quarto in `book/`, realizzato a partire da `SPECS.md`. Il libro **renderizza integralmente senza errori** (`quarto render` dalla directory `book/`, output HTML in `book/_book/`). Circa 104 000 parole di prosa/codice distribuite su 11 capitoli (7 000–11 000 parole ciascuno).

## 1. Fonti esaminate

Per ognuna delle 11 lezioni sono stati letti **integralmente**, tramite subagenti dedicati eseguiti in parallelo:

- lo slide deck `slides/0N-750AA.Rmd`;
- il transcript completo della lezione `transcripts/0N` (ognuno tipicamente 100–115 KB, ~1h30 di lezione).

Ogni audit (conservato per riferimento nello scratchpad di lavorazione della sessione, non incluso tra i deliverable finali) ha prodotto: elenco ordinato dei contenuti delle slide con notazione esatta; materiale esclusivo del transcript (intuizioni, esempi orali, aneddoti, avvertenze — la parte di valore aggiunto rispetto alle sole slide); incongruenze slide/transcript con relativa risoluzione; collegamenti con altre lezioni; una proposta di struttura del capitolo. La sintesi di tutti gli audit è in **`COURSE_MAP.md`**, che documenta la mappa ricostruita del corso, le decisioni sui confini tra capitoli e le convenzioni notazionali adottate in tutto il libro.

## 2. Mappatura lezioni → capitoli

Il libro segue l'ordine delle 11 lezioni, ma **alcuni confini di contenuto non coincidono con i confini di lezione**, perché diverse registrazioni si interrompono prima della fine delle rispettive slide (il docente rimanda il resto alla lezione successiva). Le decisioni principali, motivate in dettaglio in `COURSE_MAP.md` §2:

| Capitolo | File | Nota sul confine |
|---|---|---|
| 1 | `01-statistica-descrittiva-e-rischio-empirico.qmd` | Si ferma prima di centroide/medoide, rimandati al cap. 2 |
| 2 | `02-clustering.qmd` | Apre con le definizioni di centroide/medoide (esistenti solo nel transcript, mai scritte nelle slide) |
| 3 | `03-riduzione-dimensionalita-pca.qmd` | Include per intero il blocco finale (scelta di *k*, EFA, rotazioni) benché **senza supporto del transcript** disponibile — scritto dalle sole slide |
| 4 | `04-classificazione-knn.qmd` | Si ferma al compromesso bias-varianza; matrice di confusione/ROC **non trattati qui** |
| 5 | `05-bayes-naive-bayes-roc.qmd` | Apre con matrice di confusione/metriche (ereditate dalla coda delle slide della lezione 4, senza supporto del transcript), poi l'intera lezione 5 |
| 6 | `06-regressione-knn-bias-varianza.qmd` | Include il blocco finale "modello di regressione lineare" (semplice/polinomiale/multiplo, formule OLS chiuse) **senza supporto del transcript** |
| 7 | `07-regressione-lineare-multipla.qmd` | La seconda metà (caso frequentista generale, t-test, F-test) è **senza supporto del transcript** disponibile, scritta dalle sole slide con tono più formulare |
| 8 | `08-collinearita-regolarizzazione.qmd` | Nessuno spostamento; transcript molto ricco |
| 9 | `09-serie-storiche-decomposizione.qmd` | **Assorbe** i modelli di previsione elementari (naive/drift/kNN) e la cross-validation temporale, presenti nelle slide/transcript della lezione 9 ma assenti dalle slide della lezione 10 |
| 10 | `10-serie-storiche-smoothing-esponenziale.qmd` | Nessuno spostamento |
| 11 | `11-serie-storiche-arima.qmd` | Capitolo di chiusura del corso; termina con un paragrafo di sintesi che ricollega i quattro fili conduttori del libro (ERM, distanze, bias-varianza/CV, bayesiano/frequentista) |

## 3. Materiale aggiunto oltre le lezioni

Ogni capitolo contiene, oltre al materiale di lezione:

- **2–3 esempi nuovi** non usati in aula (dataset di voti d'esame, altezze, vendite mensili simulate, dataset sintetici per instabilità di collinearità, confronto Ridge/LASSO su variabili irrilevanti, ecc.), scelti per illustrare un fallimento, una sensibilità a un parametro, o un'ambiguità interpretativa (SPECS §10);
- **domande di comprensione** dopo ogni sezione sostanziale (2–4 domande, non di sola memoria);
- **domande di riepilogo** e sintesi ("Cosa ricordare") a fine capitolo;
- un **Laboratorio R** con la filosofia "eseguire e interpretare", mai "programmare da zero" (SPECS §14-16);
- struttura "prima di calcolare / dopo il calcolo" (SPECS §24) in ogni capitolo;
- collegamenti espliciti in prosa (non via `@ref` di Quarto, per evitare riferimenti fragili tra capitoli scritti da agenti indipendenti) ad almeno due altri capitoli.

Non è stata prodotta un'appendice di soluzioni: per scelta deliberata (SPECS §36), le domande restano senza risposta nel testo principale.

## 4. Incongruenze nelle fonti, trovate e corrette

Ogni audit per-lezione ha una propria sezione "Incongruenze" con la risoluzione adottata; le principali, effettivamente corrette nella prosa dei capitoli (silenziosamente, senza meta-commento salvo dove pedagogicamente utile):

- **Cap. 2**: indice errato nel denominatore della formula dell'indice di Dunn; sovrapposizione delle soglie "debole"/"buono" della Silhouette.
- **Cap. 3**: notazione $\overline{xv}$ resa esplicita come $\bar x v$; passaggio dimostrativo (determinante = prodotto degli autovalori) aggiunto per completezza.
- **Cap. 4**: formula dell'accuratezza incompleta nelle slide (mancava $1/n$); costante di normalizzazione mancante nella densità Gaussiana; codice R con `iris_sample <- 1:120` che sovrascriveva il campionamento casuale precedente (segnalato/aggiustato).
- **Cap. 5**: refuso nella formula binaria LDA/QDA (denominatore $P(C=+1|X=x)$ ripetuto, corretto in $P(C=-1|X=x)$).
- **Cap. 6**: formula dell'accuratezza priva di $1/n$ (stesso refuso del cap. 4, nella slide di regressione).
- **Cap. 7**: probabile refuso "MAP" per "MAE" nell'elenco degli indicatori; formula RSE priva del quadrato sul residuo.
- **Cap. 8**: normalizzazione di notazione LaTeX non standard delle slide originali (`~`, macro custom) in notazione standard.
- **Cap. 10**: formula del trend smorzato con $\phi^2$ ripetuto invece di $\phi^3,\phi^4,\ldots$; equazione del trend di Holt-Winters con un $\phi$ spurio (copiato per errore dalla versione con damping); etichetta "(trend)" errata sull'equazione di stagionalità — tutti e tre confermati a voce dal docente stesso nel transcript.
- **Cap. 11**: indice di sommatoria "$q$" al posto di "$j$" nella formula generale ARIMA; etichetta "ARIMA(2,2,2)" nel commento del codice sorgente contro l'ordine reale (2,1,2) usato nel codice e confermato a voce.

## 5. Problemi di esecuzione trovati e risolti in fase di render (Fase 6)

Il rendering (`quarto render`) ha richiesto diverse iterazioni. Problemi trovati e correzioni applicate, in ordine cronologico:

1. **`_quarto.yml` non valido**: `csl: null` non è un valore YAML accettato da Quarto per quel campo — rimossa la riga (nessun CSL specifico richiesto).
2. **Pacchetto `MedDataSets` non disponibile** per la versione di R installata (non su CRAN in forma compatibile). Usato in un solo punto (cap. 4, dataset diabete `Pima_tr2_df`): sostituito con `MASS::Pima.tr2`, lo stesso dataset originale (Pima Indians Diabetes) già disponibile in `MASS`.
3. **File locale `datasets/mnist.csv` inesistente** (cap. 3, esempio MNIST): sostituito con `dslabs::read_mnist()`, che scarica e mette in cache il dataset MNIST reale; riscritta la funzione `plot_digit` (con `reshape2::melt` per l'orientamento corretto delle immagini, verificato visivamente) e reso eseguibile anche il confronto k-means (prima `eval: false`), con l'aggiunta di una visualizzazione dei centroidi come immagini.
4. **Argomento duplicato** `xlab = "x1", xlab = "x1"` in una chiamata `plot()` nel cap. 3 (probabile refuso di editing) — rimossa la duplicazione.
5. **Pacchetti R mancanti installati**: `ggcorrplot`, `dslabs`, oltre al lotto iniziale (`ggfortify`, `glmnet`, `naivebayes`, `tseries`, `tsfeatures`, `tsfknn`, `astsa`, `car`, `caret`, `e1071`, `FNN`, `GGally`, `feasts`, `patchwork`, `pROC`, `reshape2`, `tidyr`, `dplyr`, `cluster`).
6. **`library(ggplot2)` mancante** nei capitoli 9, 10 e 11: questi capitoli caricano `forecast` (che *importa* ma non *attacca* `ggplot2`) e poi chiamano funzioni non qualificate come `ggtitle()`/`theme()`, che quindi non venivano trovate. Aggiunto `library(ggplot2)` al primo chunk eseguibile di ciascuno dei tre capitoli.
7. **Uso scorretto di `autolayer(..., colour = "colore")` su oggetti `ts` semplici** (capitoli 9 e 10): il metodo `autolayer.ts`/`autolayer.mts` del pacchetto `forecast` interpreta l'argomento `colour` come un flag logico (se colorare per serie), non come un colore effettivo — passare una stringa causa l'errore `"argument is not interpretable as logical"`. Il problema **non** si presenta per oggetti di classe `forecast` (dove `colour` viene passato correttamente come parametro grafico). Risolto rimuovendo `colour=` dalle chiamate `autolayer()` su oggetti `ts` e aggiungendo `scale_colour_manual(values = c(...))` per ottenere lo stesso effetto visivo.
8. **Intero capitolo 11 con codice R non eseguibile**: tutti i 22 blocchi di codice erano scritti come blocchi Markdown semplici (` ```r `) invece che come chunk Quarto eseguibili (` ```{r} `) — il render non generava errori (i blocchi venivano semplicemente ignorati), ma **nessun codice del capitolo veniva mai eseguito**, in violazione di SPECS §17. Convertiti tutti i 22 blocchi in chunk eseguibili e verificato il rendering completo. Un blocco identico è stato trovato e corretto anche nel capitolo 7 (un singolo esercizio con `predict()`).
9. **Combinazione di modello vietata**: `ets(nottem_train, model = "AAM")` nel cap. 10 genera l'errore `"Forbidden model combination"` — il pacchetto `forecast` non permette errore additivo con stagionalità moltiplicativa. Corretto in `model = "MAM"` (errore moltiplicativo), coerentemente con quanto l'audit della lezione 10 aveva già individuato come il modello realmente adattato dal docente a lezione (nella slide originale la variabile era erroneamente etichettata "MMM" ma il codice fittava "MAM").

Nessun altro errore di esecuzione è rimasto dopo queste correzioni: la render finale (full-book, `quarto render`) ha `EXIT CODE 0` e produce tutti gli 11 capitoli + indice + riferimenti in `book/_book/`.

## 6. Nota sull'installazione dei pacchetti R

Il primo tentativo di installazione dei pacchetti mancanti ha usato `dependencies = TRUE`, che installa anche l'intero albero di dipendenze *Suggests* (non necessario per l'uso effettivo dei pacchetti): questo ha fatto scattare la compilazione da sorgente di pacchetti pesanti e del tutto non correlati al corso (`rJava`, `hunspell`, ecc.), impiegando diverse ore senza completare l'installazione dei pacchetti effettivamente richiesti. Il processo è stato interrotto e riavviato con `dependencies = NA` (il default di R: solo *Depends*/*Imports*/*LinkingTo*), completando l'installazione dei pacchetti restanti in pochi minuti.

## 7. Verifica pedagogica (Fase 7)

Data la mole già coperta nelle fasi precedenti (ogni capitolo scritto seguendo fedelmente il template SPECS §7-§13, con audit dedicato e verifica di esecuzione), la verifica finale è stata a campione piuttosto che esaustiva:

- controllo automatico, su tutti gli 11 capitoli, di: intestazioni obbligatorie presenti (`Obiettivi del capitolo`, `Cosa ricordare`, `Domande di riepilogo`, `Laboratorio R`), bilanciamento dei blocchi callout (`:::` apertura/chiusura), assenza di riferimenti Quarto (`@sec-`) rotti tra capitoli;
- verifica visiva di due figure generate dalle correzioni più delicate (le cifre MNIST del cap. 3 e i relativi centroidi): orientamento corretto, etichette coerenti con le cifre mostrate;
- assenza di messaggi di errore o traceback residui nell'HTML renderizzato di tutti gli 11 capitoli;
- lettura diretta di apertura/chiusura di più capitoli (in particolare l'introduzione del cap. 1 e la sezione conclusiva "Chiusura del corso" del cap. 11) per verificarne tono e coerenza con SPECS §3-4 e §40.

## 8. Cosa manca o è stato omesso intenzionalmente

- **Nessuna appendice di soluzioni** (`solutions/`): la directory esiste nello scheletro del progetto ma è vuota, per scelta deliberata (SPECS §36) — non è un'omissione accidentale.
- Alcune sottosezioni (segnalate nella mappatura del §2) sono scritte principalmente dalle sole slide, senza l'apporto discorsivo del transcript, perché quest'ultimo non era disponibile per quella porzione specifica di lezione. Sono comunque scritte con lo stesso impianto pedagogico (motivazione/concetto/esempio), solo con un tono leggermente più formulare.
- Il libro non include una bibliografia estesa: `references.bib` contiene un piccolo nucleo di riferimenti standard (Ross per Statistica I, Hyndman & Athanasopoulos per le serie storiche, Kaufman & Rousseeuw per PAM, alcuni riferimenti storici citati nei capitoli), coerentemente con SPECS §34 ("non sovraccaricare un testo per undergraduate di citazioni").
- Il sito HTML renderizzato (`book/_book/`) non è stato ispezionato pagina per pagina per dettagli di stile/CSS oltre alla presenza di `styles/custom.scss`; eventuali rifiniture estetiche (spaziatura, tema scuro) sono un possibile lavoro futuro ma non richieste esplicitamente da SPECS.

## 9. Deliverable finali

```text
book/_quarto.yml
book/index.qmd
book/01-statistica-descrittiva-e-rischio-empirico.qmd
book/02-clustering.qmd
book/03-riduzione-dimensionalita-pca.qmd
book/04-classificazione-knn.qmd
book/05-bayes-naive-bayes-roc.qmd
book/06-regressione-knn-bias-varianza.qmd
book/07-regressione-lineare-multipla.qmd
book/08-collinearita-regolarizzazione.qmd
book/09-serie-storiche-decomposizione.qmd
book/10-serie-storiche-smoothing-esponenziale.qmd
book/11-serie-storiche-arima.qmd
book/references.qmd
book/references.bib
book/R/helper-functions.R
book/styles/custom.scss
book/_book/ (output renderizzato, HTML)
COURSE_MAP.md
BUILD_REPORT.md (questo file)
```

Il libro renderizza integralmente con `quarto render` dalla directory `book/`.
