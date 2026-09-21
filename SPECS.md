# SPECS — Quarto Lecture Notes for *Statistica II / Introduzione alla Statistica Computazionale*

## 1. Objective

Prepare a complete **Quarto book in Italian** based on the 11 theory lectures of the course.

The book must synthesize and reorganize two existing sources:

```text
transcripts/
    01...
    02...
    ...
    11...

slides/
    01....Rmd
    02....Rmd
    ...
    11....Rmd
```

The book is intended primarily for students taking the course.

It must **complement the slides**, not merely reproduce them and not simply turn the lecture transcripts into prose.

The desired relationship is:

> **Slides = concise structure, formulas, visual examples.**
> **Lecture notes = explanation, intuition, connections, examples, questions and guided statistical practice.**

The final notes should be useful both:

* while attending the course;
* when reviewing the material independently before the exam.

---

# 2. Source material and hierarchy

For each lecture \(01,\ldots,11\), read **both**:

1. the corresponding `.Rmd` slide source;
2. the corresponding lecture transcript.

Use them jointly.

### Slides

Treat the slides as the primary source for:

* mathematical notation;
* definitions;
* formulas;
* terminology;
* ordering of the principal topics;
* datasets and examples explicitly used in class;
* figures and R computations.

### Transcripts

Use transcripts especially to recover:

* verbal explanations;
* intuition;
* motivation;
* examples given orally;
* warnings and caveats;
* common misunderstandings;
* connections between concepts;
* comments about why a method works or fails;
* interpretation of plots or numerical results;
* remarks that are pedagogically valuable but absent from the slides.

Do **not** reproduce transcripts verbatim.

Lecture transcripts inevitably contain:

* repetitions;
* incomplete sentences;
* transcription errors;
* spoken digressions;
* imprecise notation.

Rewrite them into polished mathematical Italian.

When there is an apparent disagreement between transcript and slides, investigate the context and normally give priority to the mathematically coherent interpretation supported by the slides.

Never silently invent missing mathematical claims.

---

# 3. Overall pedagogical philosophy

The book should teach **statistical thinking**, not only definitions and algorithms.

For every important method, students should understand at least:

1. **Qual è il problema statistico?**
2. **Quali dati abbiamo?**
3. **Quale quantità vogliamo descrivere, stimare o prevedere?**
4. **Quali assunzioni stiamo facendo?**
5. **Cosa calcola concretamente il metodo?**
6. **Come interpretiamo il risultato?**
7. **Quando il metodo può essere fuorviante?**
8. **Quali alternative esistono?**

Prefer explanations that move between:

> **idea → definition → example → interpretation → limitation**

rather than long uninterrupted sequences of formulas.

---

# 4. Language and style

Write in **clear, mathematically accurate Italian**.

Target level:

* undergraduate students in mathematics / related quantitative programmes;
* mathematically comfortable but not necessarily experts in statistics or programming.

The style should be:

* concise but explanatory;
* informal enough to remain readable;
* mathematically precise;
* more discursive than the slides;
* less formal than a research monograph.

Avoid bureaucratic or excessively academic prose.

Prefer formulations such as:

> Il punto importante non è il valore \(3.7\) in sé, ma il fatto che...

or

> Questa figura suggerisce una struttura a tre gruppi. Tuttavia, il grafico da solo non dimostra che tre sia il numero “vero” di cluster.

Use short paragraphs and meaningful subsection titles.

---

# 5. Structure of the Quarto project

Create a self-contained Quarto book.

Suggested project structure:

```text
book/
│
├── _quarto.yml
├── index.qmd
│
├── 01-....qmd
├── 02-....qmd
├── ...
├── 11-....qmd
│
├── references.qmd
├── references.bib
│
├── R/
│   └── helper-functions.R
│
├── data/
│   └── ...
│
├── images/
│   └── ...
│
└── styles/
    └── custom.scss
```

Use filenames reflecting the actual topic of each lecture after examining the sources.

Do **not** impose generic titles such as `lecture01.qmd` if a meaningful title can be inferred.

---

# 6. First task: reconstruct the course structure

Before writing the chapters:

1. inspect all 11 transcripts;
2. inspect all 11 slide decks;
3. construct a concise map of the course;
4. identify:

   * principal concepts;
   * dependencies between lectures;
   * repeated topics;
   * concepts introduced informally before being formalized later;
   * examples recurring in several lectures.

Then choose a coherent chapter organization.

The final book should approximately follow the lecture order, because students need to match notes to classes.

However, **do not preserve accidental lecture boundaries at the expense of exposition**.

For example, if a concept starts at the end of lecture 4 and continues in lecture 5, chapter 4 may introduce it and chapter 5 continue it naturally.

---

# 7. Chapter template

Each chapter should begin with:

```markdown
# Titolo

## Obiettivi del capitolo
```

with approximately 3–6 learning objectives.

Example:

> Al termine del capitolo dovresti essere in grado di:
>
> * spiegare la differenza tra distanza e dissimilarità;
> * descrivere l'obiettivo di \(k\)-means;
> * interpretare un grafico elbow;
> * riconoscere situazioni in cui \(k\)-means può essere inappropriato.

Do not write objectives such as:

> “Conoscere k-means.”

Use observable intellectual tasks instead:

> “Interpretare e discutere criticamente il risultato di k-means.”

---

# 8. Section structure

Within every substantial section use, when appropriate, the following sequence.

## Motivazione

Explain why the concept is being introduced.

## Concetto / definizione

Present the mathematical object clearly.

Important definitions should be visually highlighted using Quarto callouts, for example:

```markdown
::: {.callout-important title="Definizione"}
...
:::
```

Use these sparingly.

## Intuizione

Explain what the formula means.

In particular, translate symbols into statistical meaning.

Example:

Instead of stopping at

$$
\bar x=\arg\min_m\sum_i(x_i-m)^2,
$$

continue with an explanation such as:

> La media può quindi essere vista come il punto che minimizza la distanza quadratica complessiva dai dati. Questa caratterizzazione aiuta anche a capire perché la media sia particolarmente sensibile alle osservazioni estreme.

## Esempio

Include a concrete example.

Whenever useful, use a very small synthetic dataset first and only afterwards a larger dataset.

## Interpretazione

Explicitly discuss what the result tells us statistically.

## Limiti / attenzione

Where relevant include a short warning:

```markdown
::: {.callout-warning title="Attenzione"}
...
:::
```

Typical topics:

* sensitivity to outliers;
* scale dependence;
* arbitrariness of thresholds;
* non-identifiability;
* distinction between association and causation;
* overinterpretation of visualization;
* instability with small samples.

---

# 9. Relationship with the slides

Do not duplicate entire slide sequences.

If the slide contains a compact formula such as

$$
\operatorname{RSS}(m)=\sum_i (x_i-m)^2,
$$

the notes should answer questions the slide cannot conveniently answer:

* Why is this quantity natural?
* What happens if we replace the square by an absolute value?
* What does the minimizer represent?
* How does an outlier modify the result?
* Can we see the difference numerically?

Likewise, if a slide contains a plot, the notes should explain **how to read that plot**.

The desired reaction from a student is:

> “Now I understand what that slide was trying to show.”

not:

> “This is exactly the slide written in paragraphs.”

---

# 10. Add examples beyond those used in class

For every major concept, actively look for opportunities to add a new example.

Prefer simple, interpretable contexts:

* heights;
* salaries;
* waiting times;
* exam scores;
* housing data;
* measurements from sensors;
* species measurements;
* customer behaviour;
* sports data;
* geographical measurements;
* simple simulated datasets.

Examples should illuminate a concept rather than merely add computational complexity.

A good additional example should demonstrate one of:

* why a method works;
* why two methods differ;
* a surprising failure mode;
* sensitivity to a parameter;
* an interpretive ambiguity.

---

# 11. Questions inside the chapter

The notes should frequently engage the reader.

Use short questions such as:

> Cosa ti aspetti che accada se aggiungiamo un singolo valore molto grande?

or

> Guardando soltanto questo grafico, sceglieresti \(k=3\) o \(k=4\)? Quale informazione manca per decidere?

These are not necessarily exercises requiring calculation.

They are intended to make students stop and reason.

---

# 12. Questions at the end of EVERY section

Every major section must end with a small block:

## Domande di comprensione

Normally include **2–4 questions**.

These should test understanding rather than memory.

Bad:

> Qual è la formula della varianza?

Better:

> Due dataset hanno la stessa media ma varianze molto diverse. Come appariranno qualitativamente le loro distribuzioni?

Bad:

> Cos'è PAM?

Better:

> Perché sostituire il centroide con un'osservazione reale può rendere PAM meno sensibile agli outlier rispetto a \(k\)-means?

Include a mixture of:

* conceptual questions;
* predictions;
* interpretation;
* comparison between methods;
* counterexamples;
* “what if?” questions.

---

# 13. End-of-chapter material

Each chapter should end with approximately:

```markdown
## Cosa ricordare

## Domande di riepilogo

## Laboratorio R: leggere i dati, non programmare
```

### “Cosa ricordare”

A concise synthesis of approximately 5–10 essential statements.

Do not simply list terminology.

### “Domande di riepilogo”

Approximately 5–8 questions covering the whole chapter.

Where appropriate, some can resemble the style of short conceptual questions used in course assessments.

---

# 14. Philosophy of the R exercises

This is a **critical requirement**.

The course notes must contain R exercises, but the purpose is **NOT to teach programming**.

Do not create assignments such as:

> Scrivi da zero una funzione che implementa k-means.

or:

> Scrivi un ciclo `for` che calcoli...

or:

> Implementa l'algoritmo PAM.

Instead, use R as a **statistical laboratory**.

Students should:

* run existing commands;
* inspect datasets;
* manipulate only simple options;
* compare outputs;
* interpret numerical summaries;
* interpret figures;
* evaluate model assumptions;
* identify outliers;
* compare methods;
* reason about robustness;
* explain why the result changes.

The key question should almost always be:

> **Cosa ci dicono i risultati?**

rather than:

> **Come scriviamo il codice?**

---

# 15. Format of R exercises

A typical exercise may contain code such as:

```r
set.seed(123)

x <- c(rnorm(30, 0, 1), 8)

mean(x)
median(x)
```

Then ask:

1. Confronta media e mediana.
2. Quale delle due statistiche sembra descrivere meglio il gruppo principale di osservazioni?
3. Rimuovi temporaneamente il valore \(8\). Come cambiano le due statistiche?
4. Cosa suggerisce questo esperimento sulla robustezza?

The intellectual work is **interpretation**, not programming.

---

# 16. Prefer R exercises based on outputs and plots

Whenever possible, exercises should involve:

### Reading a graph

> Osserva il dendrogramma. Quali fusioni appaiono più naturali? Dove collocheresti un possibile taglio?

### Comparing methods

```r
kmeans(...)
cluster::pam(...)
```

> Confronta le due partizioni. Quali osservazioni cambiano cluster? Perché?

### Sensitivity analysis

> Standardizza ora le variabili e ripeti l'analisi. Cosa cambia? Perché?

### Parameter interpretation

> Confronta \(k=2,3,4,5\). Quali aspetti della struttura dei dati rimangono stabili?

### Diagnostic reasoning

> Dal grafico dei residui emergono strutture sistematiche? Cosa suggeriscono sul modello?

---

# 17. Code policy

All R code included in the notes must be executable.

Whenever feasible, render the book and verify chunks.

Use a fixed seed when randomness affects results:

```r
set.seed(...)
```

Avoid unnecessary dependencies.

Prefer packages already used in the course.

If introducing a package not present in the original slides, do so only when it has a clear pedagogical purpose.

Do not turn the book into a collection of complicated `tidyverse` pipelines that distract from the statistics.

Simple code is preferable.

---

# 18. Statistical interpretation boxes

Whenever a computation produces a particularly important result, consider a callout such as:

```markdown
::: {.callout-note title="Come leggere il risultato"}
...
:::
```

Examples:

* interpreting a confidence interval;
* reading cluster memberships;
* understanding a principal component;
* interpreting an elbow plot;
* distinguishing prediction error from training error.

These should focus on **meaning**, not syntax.

---

# 19. Mathematical derivations

Include derivations when they illuminate a statistical concept.

Do not make proofs longer than pedagogically useful.

A derivation should generally answer:

> Perché questa formula ha questa forma?

Examples include:

* optimization characterizations;
* decomposition identities;
* relations between criteria;
* simple properties explaining robustness or sensitivity.

Long algebra that adds little insight can be omitted or placed in an optional box.

Use:

```markdown
::: {.callout-tip title="Approfondimento"}
...
:::
```

for material that goes slightly beyond what is required.

---

# 20. Distinguish essential and optional material

Use a clear hierarchy.

### Essential

Material needed to understand the course and exam.

### Approfondimento

Interesting mathematical or statistical context.

### Attenzione

Common errors and limitations.

### Esempio

Concrete application.

Avoid excessive callout boxes; they should help navigation rather than decorate every page.

---

# 21. Terminology

Maintain consistent Italian terminology throughout.

If an English term is standard, introduce both once:

> **clustering gerarchico** (*hierarchical clustering*)

and afterwards use the form most natural for the course.

Do not alternate arbitrarily between synonyms.

Create consistent notation across chapters even if the lecture transcript occasionally varies.

---

# 22. Connections between chapters

Explicitly point out important links.

For example:

> La caratterizzazione della media come minimizzatore della perdita quadratica ricomparirà quando discuteremo \(k\)-means.

or:

> Il problema della scala delle variabili che incontriamo qui sarà fondamentale anche nella PCA.

These cross-links are particularly valuable because the lecture format naturally separates topics that are conceptually related.

Use Quarto cross-references where appropriate.

---

# 23. Avoid false precision

The notes should make clear when a statistical procedure is heuristic.

In particular avoid statements such as:

> Il metodo elbow determina il numero corretto di cluster.

Prefer:

> Il metodo elbow fornisce un criterio esplorativo: in alcuni dataset il cambio di pendenza è evidente, in altri non esiste una scelta univoca.

Distinguish:

* theorem;
* rule of thumb;
* diagnostic;
* algorithm;
* modelling assumption;
* exploratory method.

---

# 24. Encourage interpretation before computation

Whenever possible structure examples in this order:

### Prima di calcolare

Ask:

> Cosa ti aspetti?

### Calcolo

Run the method.

### Dopo il calcolo

Ask:

> Il risultato coincide con la tua previsione? Se no, perché?

This pattern should appear repeatedly throughout the book.

---

# 25. Figures

Reuse useful figures generated in the original `.Rmd` slides when possible.

Do not copy screenshots of plots when the original R code can regenerate them.

Figures should have:

* informative captions;
* legible labels;
* consistent size;
* explicit discussion in the surrounding prose.

Never leave a plot without explaining what the student should notice.

---

# 26. Datasets

Reuse course datasets whenever useful.

Additional datasets may be introduced when they provide a particularly clean example.

Prefer:

* datasets bundled with R/packages;
* small reproducible datasets;
* openly available data.

Avoid examples requiring fragile downloads from external websites if an equivalent reproducible example exists locally.

---

# 27. Exercises of increasing depth

Where appropriate, organize end-of-chapter exercises into roughly three levels.

### Comprendere

Basic interpretation.

### Ragionare

Compare methods, identify assumptions, predict behaviour.

### Esplorare con R

Run an analysis and interpret it.

Do not assign difficulty scores.

---

# 28. Example of the desired exercise style

### Esercizio — L'effetto della scala

Considera un dataset con two variables:

* età, measured in years;
* reddito, measured in euros.

Run clustering on the raw variables and then on standardized variables.

Provide the required R commands.

Ask:

1. Quale variabile domina la distanza prima della standardizzazione?
2. Come cambia la partizione dopo `scale()`?
3. Quale delle due analisi è più sensata?
4. La standardizzazione è sempre necessaria? Spiega da cosa dipende.

This is an excellent exercise.

An exercise asking students to implement standardization manually is not.

---

# 29. Preserve the instructor's pedagogical voice

The transcripts contain useful indications of how the material was actually explained during the lectures.

Preserve recurring pedagogical ideas and characteristic examples where they improve understanding.

However:

* remove filler;
* remove repetition;
* remove oral false starts;
* correct grammar;
* verify mathematical statements;
* turn informal comments into concise explanations.

The result should feel related to the actual course rather than like a generic statistics textbook.

---

# 30. Do not blindly follow the transcript

The transcript is evidence of what was said, not authoritative edited prose.

When necessary:

* reorganize explanations;
* place an example earlier or later;
* merge repeated explanations;
* repair incomplete arguments;
* introduce a definition before discussing its consequences.

The final criterion is pedagogical coherence.

---

# 31. Coverage audit

Maintain a private checklist while writing.

For every important item appearing in the slides, mark one of:

```text
COVERED
COVERED ELSEWHERE
INTENTIONALLY OMITTED
```

Anything marked `INTENTIONALLY OMITTED` should have a pedagogical reason.

Similarly, identify valuable transcript material absent from the slides and incorporate it when appropriate.

This prevents accidentally losing material while reorganizing the lectures.

---

# 32. Quarto features to use

Use native Quarto functionality where useful:

* chapter and section numbering;
* cross-references;
* theorem/definition environments if appropriate;
* callouts;
* figure captions;
* citations;
* table of contents;
* code folding only when pedagogically appropriate.

For student notes, the important statistical R code should normally remain visible.

---

# 33. Book front matter

`index.qmd` should contain approximately:

# Statistica II / Introduzione alla Statistica Computazionale

followed by a short introduction explaining:

* these notes accompany the lectures;
* they do not replace attendance/slides;
* emphasis is on understanding and interpretation;
* R is used as a tool for exploring statistical concepts.

Include a brief section:

## Come usare queste note

suggesting:

1. read the conceptual section;
2. answer embedded questions before revealing/computing results;
3. reproduce R examples;
4. attempt end-of-section questions;
5. use slides for rapid revision.

---

# 34. References

If external material is added beyond the slides/transcripts, cite reliable sources.

Do not overload an undergraduate text with references.

A small bibliography is sufficient.

Separate claims deriving from standard statistical knowledge from specific historical or methodological claims that merit citation.

---

# 35. Optional enrichment

When genuinely useful, include short boxes such as:

### Un po' di storia

For historically interesting ideas.

### Collegamento matematico

For a mathematical interpretation.

### Nella pratica

For applied statistical advice.

### Un errore frequente

For common misconceptions.

These boxes should be short and selective.

---

# 36. Solutions

Do **not** place complete solutions immediately after every exercise, because students should be able to work independently.

If solutions are produced, place them in a separate appendix or instructor file.

For interpretation questions, concise expected-answer notes may be created separately, e.g.

```text
solutions/
    01-soluzioni.qmd
    ...
```

The main student-facing book should not reveal them automatically.

---

# 37. Deliverables

The agent should deliver at minimum:

```text
_quarto.yml
index.qmd
01-....qmd
...
11-....qmd
references.qmd
references.bib
```

plus any required:

```text
R/
data/
images/
styles/
```

Also provide:

```text
COURSE_MAP.md
```

containing the reconstructed structure of the 11 lectures, and:

```text
BUILD_REPORT.md
```

containing:

* sources inspected;
* chapter mapping;
* added examples;
* added R laboratories;
* any source inconsistencies found;
* anything omitted intentionally;
* any code/rendering issues remaining.

---

# 38. Workflow

Do the work in this order.

### Phase 1 — Audit

Read all slides and transcripts.

Produce `COURSE_MAP.md`.

### Phase 2 — Skeleton

Create `_quarto.yml`, `index.qmd`, and all 11 chapter files containing the full section hierarchy.

### Phase 3 — Content

Fill chapters one at a time using slides + transcript.

### Phase 4 — Enrichment

Add:

* intuition;
* new examples;
* interpretation boxes;
* questions;
* R laboratories;
* cross-links.

### Phase 5 — Consistency

Check:

* notation;
* terminology;
* chapter dependencies;
* duplicate explanations;
* missing concepts.

### Phase 6 — Execution

Render the entire Quarto book.

Fix:

* R errors;
* broken references;
* malformed LaTeX;
* missing images;
* layout problems.

### Phase 7 — Final pedagogical audit

Read the notes as a student would.

For each major concept verify that the reader can answer:

> Cos'è?
> Perché ci serve?
> Come funziona?
> Come interpreto il risultato?
> Quando devo stare attento?

---

# 39. Acceptance criteria

The task is complete only if all of the following are true:

* All 11 theory lectures are represented.
* Both slides and transcripts have actually been used.
* The text is not simply a cleaned transcript.
* The text is not simply expanded slide bullets.
* Mathematical notation is consistent.
* Important definitions are easy to identify.
* Every substantial section contains comprehension questions.
* Every chapter contains student activities.
* Every chapter contains statistical interpretation.
* R appears regularly.
* R exercises test **data/statistical reasoning rather than programming skill**.
* Important plots and outputs are explicitly interpreted.
* The book contains examples beyond those appearing in the original lectures.
* Limitations and common misconceptions are discussed.
* The full Quarto project renders successfully.
* The notes remain recognizably aligned with the actual course.

---

# 40. Central instruction to the agent

Use this principle whenever deciding whether to add something:

> **The lecture notes should contain what an attentive student would ideally have written down after understanding the lecture—not everything that was said, and not only what appeared on the slides.**

And for the R components:

> **Do not ask students to prove that they can program. Use R to force them to look at data, predictions, graphs and statistical outputs and explain what they mean.**

The strongest version of the book would also make the **11 chapters internally cumulative**: concepts such as loss functions, robustness, scale, variability, optimization, exploratory versus inferential reasoning, etc. should be explicitly connected when they reappear, rather than being treated as isolated lecture topics.
