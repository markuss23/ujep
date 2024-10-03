# Load necessary libraries
library(rvest)
library(dplyr)
library(ggplot2)

# Read the CSV file
df <- read.csv("/home/marek/projects/ujep/zzd/cviceni/shootings.csv")

# Convert the date column to Date format
df$date <- as.Date(df$date)

# Extract year from the date
df$year <- format(df$date, "%Y")

# Use the filter you defined to select top 5 states
filter <- df %>%
  group_by(state) %>%
  summarise(total_count = n()) %>% 
  arrange(desc(total_count)) %>%
  head(5)

# Aggregate the data by state and year, and count the occurrences
aggregated_data <- df %>%
  filter(state %in% filter$state) %>%  # Use the filter to select only the top 5 states
  group_by(state, year) %>%
  summarise(total_count = n())

# Create a bar plot
ggplot(aggregated_data, aes(x = year, y = total_count, fill = state)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~state, scales = "free_y")
  +
  labs(title = "Shootings Count in Top 5 States by Year",
       x = "Year",
       y = "Shootings Count",
       fill = "State") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
