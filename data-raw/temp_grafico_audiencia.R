library(dplyr)
library(ggplot2)

rick_and_morty <- readr::read_rds("data/rick_and_morty.rds")

rick_and_morty %>%
  mutate(num_temporada = as.factor(num_temporada)) %>%
  ggplot(aes(
    x = num_episodio,
    y = qtd_espectadores_EUA,
    fill = num_temporada)
  ) +
  geom_col() +
  labs(
    x = "episodio",
    y = "audiencia",
    fill = "temporada",
    title = "Rick and Morty"
  ) +
  theme(
    text = element_text(
      colour = "#11a2c6",
      family = "Get Schwifty",
      size = 16
    ),
    plot.title = element_text(
      family = "Get Schwifty",
      hjust = 0.5,
      size = 30
    ),
    axis.text = element_text(color = "white"),
    axis.ticks.x = element_line(color = "white"),
    panel.background = element_rect(fill = "black"),
    panel.grid.major.y = element_line(size = 0.1),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    legend.position = "bottom",
    legend.background = element_rect(fill = "black", color = "black"),
    plot.background = element_rect(fill = "black", color = "black")
  )



# -------------------------------------------------------------------------

rick_and_morty %>%
  mutate(num_temporada = as.factor(num_temporada)) %>%
  group_by(num_temporada) %>%
  summarise(
    audiencia_media = sum(qtd_espectadores_EUA)
  ) %>%
  ggplot(aes(
    x = num_temporada,
    y = audiencia_media,
    fill = num_temporada
  )) +
  geom_col(show.legend = FALSE) +
  labs(
    x = "episodio",
    y = "audiencia",
    title = "Rick and Morty"
  ) +
  theme(
    text = element_text(
      colour = "#11a2c6",
      family = "Get Schwifty",
      size = 16
    ),
    plot.title = element_text(
      family = "Get Schwifty",
      hjust = 0.5,
      size = 30
    ),
    axis.text = element_text(color = "white"),
    axis.ticks.x = element_line(color = "white"),
    panel.background = element_rect(fill = "black"),
    panel.grid.major.y = element_line(size = 0.1),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    legend.position = "bottom",
    legend.background = element_rect(fill = "black", color = "black"),
    plot.background = element_rect(fill = "black", color = "black")
  )


