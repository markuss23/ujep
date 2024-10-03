#rm(list=ls())
library(ggplot2) 
library(dplyr)


df <- read.csv("/home/marek/Downloads/StudentsPerformance.csv")
plot(df$writing.score, df$reading.score)

df %>% 
  ggplot(aes(x = writing.score, y = reading.score)) +
  geom_point()

df <- df %>%
  mutate(avg_score = ((math.score +reading.score + writing.score)/3))
hist(df$avg_score)


ggplot(df, aes(x=avg_score)) + geom_histogram(bins=10,color="black", fill="grey")

df %>% ggplot(aes(x=race.ethnicity,y=math.score)) +  
  geom_boxplot(color="green")


