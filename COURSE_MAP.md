# COURSE_MAP — Statistica II / Introduzione alla Statistica Computazionale

Ricostruzione della struttura del corso a partire dall'audit congiunto di tutte le 11 slide deck (`slides/0N-750AA.Rmd`) e di tutti gli 11 transcript (`transcripts/0N`). Gli audit dettagliati (~20-30k caratteri ciascuno) sono conservati nello scratchpad di lavorazione; questo documento ne è la sintesi operativa usata per pianificare i capitoli del libro.

## 1. Filo conduttore del corso

Il corso ha quattro blocchi tematici, tutti unificati da un unico principio metodologico enunciato fin dalla lezione 1 e mai abbandonato:

> **Un indicatore statistico o un modello è (quasi sempre) il minimizzatore di una funzione di perdita empirica (ERM).**

- Blocco A — Dati non supervisionati (lezioni 1-3): statistica descrittiva come ERM, distanze multivariate, clustering (k-means/PAM/gerarchico), curse of dimensionality, PCA.
- Blocco B — Classificazione (lezioni 4-5): KNN, richiami di probabilità, cross-validation, bias-varianza, classificatori bayesiani (Naive Bayes, LDA/QDA, regressione logistica), ROC/AUC.
- Blocco C — Regressione (lezioni 6-8): KNN per regressione, decomposizione bias-varianza (dimostrazione formale), OLS/regressione lineare multipla, quantificazione dell'incertezza (bootstrap, bayesiano/frequentista), collinearità e riduzione dei modelli (stepwise, PCR, Ridge/LASSO).
- Blocco D — Serie storiche (lezioni 9-11): vocabolario di base (decomposizione, ACF) e modelli di previsione elementari, smoothing esponenziale (ETS/Holt-Winters), processi stocastici/stazionarietà/ARIMA.

Temi ricorrenti che vanno esplicitamente collegati fra capitoli (si vedano i "Collegamenti" di ciascun capitolo sotto):

- **ERM / funzioni di perdita**: media↔quadratica, mediana↔assoluta, quantili↔asimmetrica, moda↔0-1 (cap. 1) → WCSS/WCR nel clustering (cap. 2) → rischio atteso in classificazione (cap. 4) → MSE in regressione (cap. 6-7) → SSE nelle serie storiche (cap. 10-11).
- **Distanze e norme** (cap. 1) → clustering (cap. 2) → curse of dimensionality (cap. 3) → KNN classificazione/regressione (cap. 4, 6) → geometria di Ridge/LASSO (cap. 8).
- **Standardizzazione/scala delle variabili**: ricorre in cap. 3 (PCA), cap. 4 (KNN), cap. 6 (KNN regressione) — motivo ricorrente per introdurre `scale()`.
- **Cross-validation**: introdotta in cap. 4 (Lp0, k-fold) → riusata in cap. 6 (LOO-CV) → cap. 8 (scelta di k in PCR, λ in Ridge/LASSO) → adattata alle serie storiche in cap. 9 (rolling origin) e cap. 11.
- **Bias-varianza**: qualitativo in cap. 4 → dimostrazione formale in cap. 6 → riappare come motivazione della regolarizzazione in cap. 8.
- **Bootstrap**: introdotto in cap. 7 (incertezza sui coefficienti OLS) → riusato in cap. 10-11 (intervalli di previsione sui residui delle serie storiche), con l'avvertenza esplicita che sulle serie storiche si campiona *solo* dai residui, mai dagli istanti temporali.
- **AIC/BIC**: introdotti in cap. 8 (selezione di variabili) → riusati identici in cap. 10-11 (selezione tra modelli ETS/ARIMA).
- **Bayesiano vs frequentista**: introdotto sistematicamente in cap. 5 (stimatori puntuali) e cap. 7 (intervalli), riappare in cap. 10 (interpretazione degli intervalli di previsione).
- **Causalità vs correlazione**: cap. 3 (Pearson) → cap. 7 (interpretazione dei coefficienti di regressione).

## 2. Struttura dei capitoli (mapping lezione → capitolo)

Il libro ha 11 capitoli, uno per lezione, ma **i confini di contenuto non coincidono sempre con i confini del file audio/video**, perché diverse lezioni si sono fermate prima della fine delle rispettive slide, rimandando il resto al giorno successivo. Si segue quindi la regola SPECS §6: si usano le slide (fonte primaria per ordine e contenuto matematico) per decidere dove finisce un capitolo, non la sola durata della registrazione.

### Capitolo 1 — Dalla statistica descrittiva al rischio empirico
File: `01-statistica-descrittiva-e-rischio-empirico.qmd` · Fonti: slide 01 + transcript 01

Indicatori di centralità/variabilità (moda, mediana, media, quantili, varianza) reinterpretati come minimizzatori di funzioni di perdita (quadratica, assoluta, assoluta asimmetrica, 0-1, esponenziale); paradigma ERM; passaggio ai dati multivariati (data frame, notazione $x_{i,j}$); quattro distanze (euclidea, Manhattan/$\ell^1$, $\ell^p$, $\ell^\infty$) e loro geometria (palle unitarie, apre verso la regolarizzazione). **Si ferma prima di centroide/medoide**, esplicitamente rimandati al capitolo 2.

### Capitolo 2 — Clustering
File: `02-clustering.qmd` · Fonti: slide 02 + transcript 02

Apre con centroide e medoide (le cui *definizioni* esistono solo nel transcript, non nelle slide: vanno ricostruite). Poi: il problema del clustering, k-means/Lloyd (WCSS, celle di Voronoi), PAM/k-medoids (WCR), clustering gerarchico (dendrogramma, AGNES, DIANA), selezione di $k$ (Elbow, indice di Dunn, Silhouette). Nessun dataset reale in questa lezione (puramente teorica); i comandi R (`kmeans`, `pam`, `hclust`/`agnes`/`diana`, `cutree`, `silhouette`) vanno introdotti nel laboratorio R del capitolo, anticipando la lezione 3.

### Capitolo 3 — Riduzione della dimensionalità e PCA
File: `03-riduzione-dimensionalita-pca.qmd` · Fonti: slide 03 + transcript 03

Curse of dimensionality (con l'euristica segnale/rumore, solo orale); varianza direzionale e matrice delle covarianze (dimostrazione di $\operatorname{var}(xv)=v^T\operatorname{var}(x)v$); correlazione di Pearson e matrice di correlazione; framework generale di riduzione della dimensionalità (proiezione vs generativo); PCA (caso $k=1$, caso generale, teorema spettrale, algoritmo, biplot); **criteri per scegliere $k$ (scree plot/Kaiser/varianza cumulata) ed EFA (equazione fondamentale, unicità/comunalità, rotazioni)**. Questi ultimi non sono coperti da nessun transcript disponibile (la lezione 3 si interrompe prima, la lezione 4 non li riprende): vanno scritti principalmente dalle sole slide, con tono più asciutto, segnalato nel BUILD_REPORT.

### Capitolo 4 — Classificazione: K-Nearest Neighbors e validazione
File: `04-classificazione-knn.qmd` · Fonti: slide 04 (fino a "Compromesso bias-varianza") + transcript 04

Il problema della classificazione; KNN ($k=1$ e $k$ generale); accuratezza, training/test error; errore di generalizzazione e modello probabilistico i.i.d.; richiami di probabilità (eventi, variabili aleatorie, Bernoulli/Binomiale/Gaussiana — con la costante di normalizzazione mancante nella slide da ripristinare); convalida incrociata (leave-$p$-out, k-fold); compromesso bias-varianza (evidenza qualitativa, bersaglio). **Si ferma qui**: classificatori binari, matrice di confusione e curva ROC (pur presenti nel file `04-750AA.Rmd`) vanno al capitolo 5, dove il transcript li tratta davvero.

### Capitolo 5 — Formula di Bayes e classificatori generativi
File: `05-bayes-naive-bayes-roc.qmd` · Fonti: slide 04 (coda) + slide 05 + transcript 05

Apre con **classificatori binari, matrice di confusione e metriche** (prevalenza, precisione, TPR/FPR) ereditate dalla coda di `04-750AA.Rmd` — sezione da scrivere principalmente dalle sole slide (nessun transcript disponibile per questa parte specifica). Poi: formula di Bayes, stimatori puntuali (MAP/MLE), esempio Bernoulli/Beta e regola di successione di Laplace, stima di media/varianza gaussiana; modelli generativi vs discriminativi; Naive Bayes (Bernoulli e Gaussiano); curva ROC e AUC (qui pienamente coperti dal transcript, nel contesto Naive Bayes); LDA/QDA; regressione logistica; multi-classe (One-vs-All/One-vs-One, softmax). **Attenzione**: correggere il refuso della slide 05 riga 475/477 ($P(C=+1|X=x)$ ripetuto anche a denominatore, deve essere $P(C=-1|X=x)$).

### Capitolo 6 — Regressione: da KNN al metodo dei minimi quadrati
File: `06-regressione-knn-bias-varianza.qmd` · Fonti: slide 06 (intera) + transcript 06 (fino a "Problemi del metodo")

Il problema della regressione (ponte esplicito con la classificazione); regressione e interpolazione (con/senza outlier); KNN per regressione; indicatori di performance (MSE, RMSE, MAE, MAPE, $R^2$); errori di train/validation/test/generalizzazione; **dimostrazione formale della decomposizione bias²+varianza+rumore** (via teorema di Pitagora per v.a. — il contenuto matematico esiste solo nel transcript, le slide hanno solo titoli vuoti "Passo 1"/"Passo 2"); verso i modelli parametrici, OLS, equivalenza con MLE sotto rumore gaussiano. **Include anche**, come sezione finale sorgente-solo-slide (nessun transcript), il blocco "Modello di regressione lineare": definizione generale, casi (semplice/polinomiale/multiplo/con interazioni), CV sul grado polinomiale, formula chiusa $\beta_{OLS,0},\beta_{OLS,1}$ per la regressione semplice — la lezione 7 li dà esplicitamente per "richiamati".

### Capitolo 7 — Regressione lineare multipla e quantificazione dell'incertezza
File: `07-regressione-lineare-multipla.qmd` · Fonti: slide 07 (intera) + transcript 07 (fino alla densità di Student per il modello costante bayesiano)

Notazione matriciale, matrice di Gram, dimostrazione $\beta_{OLS}=G^{-1}\Phi(\bm x)^T\bm y$, interpretazione geometrica dell'MSE (proiezione ortogonale), esempio iris; bootstrap (procedura, IC bootstrap su parametri, modello e previsione, differenza bootstrap/CV); approccio parametrico bayesiano/frequentista: modello costante (ponte con Statistica I) con densità di Student, poi **caso generale** (Student multivariata, IC su $\beta$/modello/previsione, t-test, F-test) — quest'ultima parte va scritta principalmente dalle sole slide (il transcript disponibile si interrompe a metà). **Attenzione**: correggere probabile refuso "MAP"→"MAE" nei richiami e formula RSE priva del quadrato.

### Capitolo 8 — Riduzione dei modelli di regressione: collinearità e regolarizzazione
File: `08-collinearita-regolarizzazione.qmd` · Fonti: slide 08 + transcript 08

Diagnosi di (multi)collinearità (correlogramma, condizionamento $\kappa(G)$, VIF — con l'esempio in cui i due indicatori sono in disaccordo, usato apposta come caveat); cenno diagnostico (non test formale) sulla gaussianità dei residui; selezione di variabili (t-test, AIC/BIC, stepwise forward/backward/both — con il monito centrale "non eliminare più variabili collineari insieme"); PCR; regolarizzazione (Ridge/LASSO, interpretazione variazionale e bayesiana, geometria della sparsità di LASSO); tabella riassuntiva finale con linee guida pratiche.

### Capitolo 9 — Serie storiche I: visualizzazione, decomposizione e previsione elementare
File: `09-serie-storiche-decomposizione.qmd` · Fonti: slide 09 (intera) + transcript 09 (intero)

Definizione di serie storica (dipendenza vs indipendenza); time plot (univariato/multivariato); decomposizione (trend/stagionalità/ciclo/residuo, additiva/moltiplicativa); grafici stagionali e di sottoserie; serie ritardata e lag plot; autocovarianza/autocorrelazione (ACF), correlazione incrociata; trasformazioni per la stazionarietà "pratica" (differenziazione, log/Box-Cox, rimozione trend via regressione); calcolo esplicito di componente stagionale e residui. **Include anche**, a differenza di quanto inizialmente ipotizzato nell'audit isolato, i modelli di previsione elementari (naive, media, naive stagionale, drift), la previsione KNN per serie storiche e la cross-validation temporale (rolling origin) — presenti sia nelle slide 09 sia nel transcript 09 (ultimi ~40 minuti), e assenti dalle slide 10: appartengono quindi strutturalmente a questo capitolo, non al successivo.

### Capitolo 10 — Serie storiche II: smoothing esponenziale e famiglia ETS
File: `10-serie-storiche-smoothing-esponenziale.qmd` · Fonti: slide 10 + transcript 10

SES; notazione ETS (stato/osservazione, errore additivo/moltiplicativo); Holt (trend); Holt con trend smorzato; Holt-Winters (trend+stagionalità, con la stagionalità *adattiva* contrapposta esplicitamente a quella fissa della decomposizione classica del cap. 9); famiglia ETS generale; equivalenza SSE↔MLE; selezione di modello con AIC/BIC; intervalli di previsione parametrici; verifica di gaussianità dei residui (Shapiro-Wilk, Jarque-Bera); intervalli di previsione bootstrap (solo sui residui). **Attenzione**: correggere nel capitolo tre refusi delle slide, tutti confermati a voce dal docente stesso: (1) formula del trend smorzato con $\phi^2$ ripetuto invece di $\phi^3,\phi^4,\dots$; (2) equazione del trend di Holt-Winters che include erroneamente $\phi$ (copy-paste da Holt damped); (3) etichetta "(trend)" sull'equazione della stagionalità.

### Capitolo 11 — Processi stocastici e modelli ARIMA
File: `11-serie-storiche-arima.qmd` · Fonti: slide 11 + transcript 11

Processo stocastico e processo gaussiano; funzioni teoriche di media/autocovarianza/autocorrelazione; stazionarietà (con l'esempio controintuitivo $Y_t=t$: covarianza teorica nulla ma ACF campionaria "a banda"); stimatore campionario e legame con `acf()`; differenziazione e stazionarietà; test di stazionarietà (KPSS vs PP/ADF — attenzione alle ipotesi nulle opposte); completamento della decomposizione classica via media mobile (filtro passa-basso); modelli ARIMA (punto di vista delle innovazioni, AR(p), MA(q), ARIMA(p,d,q), SARIMA); ACF teorica dei modelli ARIMA (Yule-Walker); stima dei parametri; previsione; selezione del modello (AIC/BIC/AICc, `auto.arima`, CV rolling-origin); confronto finale ETS vs ARIMA (con il capovolgimento training→CV che richiama esplicitamente la lezione 1 delle serie storiche). Capitolo di chiusura del corso: buona sede per un breve paragrafo di sintesi finale che ricollega i quattro blocchi tematici.

## 3. Convenzioni notazionali da mantenere uniformi in tutto il libro

- Parametro generico di un modello: $\theta$; per la regressione, dal capitolo 7 in poi si passa a $\beta$ (coefficienti) — spiegare esplicitamente il cambio la prima volta che accade.
- Funzione di perdita: $\ell(x;h)$ (non $L$, benché usato a voce in lezione 1).
- Campione: $\{x_i\}_{i=1}^n$ univariato, $x_i\in\mathbb R^d$ multivariato, organizzato come data frame $n\times d$.
- Distanze: $\|\cdot\|$ generica, $\|\cdot\|_1,\|\cdot\|_2,\|\cdot\|_\infty,\|\cdot\|_p$ per i casi specifici.
- Varianza/covarianza campionaria multivariata: $\operatorname{var}(x)\in\mathbb R^{d\times d}$, $\operatorname{cov}(x_j,x_\ell)$; matrice di correlazione $\operatorname{cor}(x)$.
- Modello di regressione: $\Phi(x)\in\mathbb R^p$ vettore riga di feature trasformate, $\beta\in\mathbb R^p$ vettore colonna, $G=\Phi(\bm x)^T\Phi(\bm x)$ matrice di Gram.
- Serie storiche: $(y_t)_{t=1,\ldots,T}$ osservato, $(Y_t)$ processo stocastico soggiacente (lettera maiuscola solo dal cap. 11 in poi, quando si passa al modello probabilistico esplicito); operatore di ritardo $L$ (annotare una volta che il testo di riferimento usa $B$).
- Refusi noti da correggere silenziosamente nel testo finale (fonte: sezione "Incongruenze" di ciascun audit): formula dell'accuratezza incompleta (cap. 4), Gaussiana priva della costante di normalizzazione (cap. 4), indice errato nella formula di Dunn (cap. 2), $P(C=+1|X=x)$ ripetuto a denominatore in LDA/QDA binario (cap. 5), "MAP"→"MAE" e RSE senza quadrato (cap. 7), $\phi^2$ ripetuto e $\phi$ spurio in Holt-Winters (cap. 10), indice di sommatoria $q$→$j$ nella formula ARIMA generale (cap. 11).

## 4. Pacchetti R usati nel corso

`ggplot2`, `dplyr`, `tidyr`, `reshape2`, `GGally`, `gridExtra`, `patchwork`, `knitr` (grafica/dati); `class`, `FNN`, `caret`, `e1071`, `naivebayes`, `pROC`, `MedDataSets` (classificazione); `MASS`, `car`, `glmnet` (regressione); `forecast`, `tseries`, `feasts`, `tsfeatures`, `astsa`, `tsfknn` (serie storiche); `ggfortify`, `ggbiplot` (PCA). Dataset ricorrenti: `iris`, `mtcars`, `MASS::Boston`, MNIST (locale), `AirPassengers`, `EuStockMarkets`, `nottem`, `BJsales`.

## 5. Note per la stesura

- Ogni capitolo deve seguire il template SPECS §7-§13 (Obiettivi, sezioni con Motivazione/Concetto/Intuizione/Esempio/Interpretazione/Limiti, Domande di comprensione per sezione, Cosa ricordare, Domande di riepilogo, Laboratorio R).
- Il materiale "solo transcript" (moltissimo, si veda ogni audit) è la parte che dà valore aggiunto rispetto alle slide: va integrato in prosa, non elencato come lista.
- Dove un capitolo include materiale "solo slide" (senza transcript di supporto — cap. 3 tail, cap. 6 tail, cap. 7 tail), scriverlo comunque con lo stesso impianto pedagogico (motivazione, intuizione, esempio), ma segnalarlo nel BUILD_REPORT come sezione con minor apporto discorsivo orale.
