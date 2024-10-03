library(rvest)
library(dplyr)
library(tidyverse)
html_content <- read_html(url("https://ki.ujep.cz/cs/historie/"))
vedouci <- html_table(html_content, header = TRUE)[[2]]
vedouci$Do[vedouci$Do=="Dosud"] <- 2024
vedouci$Do <- as.integer(vedouci$Do)

vedouci <- vedouci %>%
  mutate(Celkem_let = (Do - Od)) %>%
  arrange(desc(Celkem_let))

students_content <- read.csv("/home/marek/Downloads/StudentsPerformance.csv")
students_content <- students_content %>%
  mutate(avg_score = ((math.score +reading.score + writing.score)/3))

filtered_data <- students_content %>% filter(parental.level.of.education=="high school")

summary_data <- filtered_data %>%
  group_by(gender, race.ethnicity) %>%
  summarise(mean_avg_score = mean(avg_score))

summary_data<- summary_data %>% pivot_wider(
  names_from = gender,
  values_from=avg_score
)