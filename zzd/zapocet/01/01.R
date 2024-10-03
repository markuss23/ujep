library(dplyr)
library(ggplot2)

data <- read.csv("/home/marek/projects/ujep/zzd/zapocet/01/202405.csv")
types_data <- read.csv("/home/marek/projects/ujep/zzd/zapocet/01/types.csv")

counts <- data %>%
  group_by(types) %>%
  summarize(count = n())%>%
  arrange(desc(count))
counts <- head(counts,5)

merged_data <- counts %>%
  left_join(types_data, by = c("types" = "id"))

# Volitelně můžeme vybrat pouze sloupce, které nás zajímají
final_data <- merged_data %>%
  select(label, count)

# Seřazení od největšího po nejmenší
sorted_data <- final_data %>%
  arrange(desc(count))

# Výběr top 5
top5_data <- head(sorted_data, 5)

# Zobrazení výsledků
print(top5_data)


library(lubridate) 
data_h <- read.csv("/home/marek/projects/ujep/zzd/zapocet/01/202405.csv")

data_h$date <- ymd_hms(data_h$date)
data_h$hour <- hour(data_h$date) # Použití funkce hour() z lubridate k extrakci hodin

top5_crime_labels <- counts$types
filtered_data <- data_h %>%
  filter(types %in% top5_crime_labels)

average_crime <- filtered_data %>%
  group_by(types, hour) %>%
  summarize(avg_reports = mean(types)) # Opravení chybějícího závěrečného symbolu


# Vykreslení sloupcových grafů pro každou podkategorii trestných činů
for (crime_label in unique(average_crime$types)) {
  crime_data <- filter(average_crime, types == crime_label)
  p <- ggplot(crime_data, aes(x = hour, y = avg_reports, fill = types)) +
    geom_bar(stat = "identity") +
    labs(title = crime_label, x = "Hodina", y = "Průměrný počet hlášení", fill = "Hlavní kategorie") +
    theme_minimal()
  print(p)
}
