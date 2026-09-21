# Funzioni di supporto condivise dal libro.
# Caricato nei capitoli con: source("R/helper-functions.R")

# Tema grafico comune per ggplot2, usato per uniformare lo stile delle figure.
tema_libro <- function() {
  ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold"),
      panel.grid.minor = ggplot2::element_blank()
    )
}
