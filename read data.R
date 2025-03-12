# Load necessary libraries
library(dplyr)
library(readr)
library(writexl)
library(arrow)
library(haven)      # for SAS
library(microbenchmark)   # for Timing
library(stringi)
library(ggplot)

# Step 1: Create a synthetic dataset
set.seed(42)  # For reproducibility
n <- 1e6  # Number of rows
state_abbreviations <- state.abb  # Built-in vector of US state abbreviations

dataset <- tibble(
  Name = stri_rand_strings(n, 7, pattern = "[A-Za-z]"),
  Age = sample(0:100, n, replace = TRUE),
  Sex = sample(c("Male", "Female"), n, replace = TRUE, prob = c(0.51, 0.49)),
  Race = sample(c("White", "Black", "Asian", "Native American", "Other"), n, replace = TRUE, prob = c(0.6, 0.13, 0.08, 0.02, 0.17)),
  Ethnicity = sample(c("Hispanic", "Non-Hispanic"), n, replace = TRUE, prob = c(0.18, 0.82)),
  Income = round(runif(n, 20000, 150000), 2),  # Annual income
  BirthState = sample(state_abbreviations, n, replace = TRUE),  # Random state abbreviations
  Date = as.Date("2000-01-01") + sample(0:10000, n, replace = TRUE)  # Random date
)

# Step 2: Write dataset to different formats
write_csv(dataset, "state_census_data.csv")
write_delim(dataset, "state_census_data.txt", delim = "\t")
write_xlsx(dataset, "state_census_data.xlsx")
write_parquet(dataset, "state_census_data.parquet")
write_sas(dataset, "state_census_data.sas7bdat")

# Step 3: Function to time reading files
time_read <- function() {
  csv_time <- microbenchmark(read_csv("state_census_data.csv"), times = 5)
  txt_time <- microbenchmark(read_delim("state_census_data.txt", delim = "\t"), times = 5)
  xlsx_time <- microbenchmark(readxl::read_xlsx("state_census_data.xlsx"), times = 5)
  parquet_time <- microbenchmark(read_parquet("state_census_data.parquet"), times = 5)
  sas_time <- microbenchmark(read_sas("state_census_data.sas7bdat"), times = 5)
  
  tibble(
    Format = c("CSV", "TXT", "XLSX", "Parquet", "SAS"),
    Time = c(
      mean(csv_time$time) / 1e6,
      mean(txt_time$time) / 1e6,
      mean(xlsx_time$time) / 1e6,
      mean(parquet_time$time) / 1e6,
      mean(sas_time$time) / 1e6
    )
  ) %>%
    arrange(Time)
}

# Step 4: Display read times
read_times <- time_read()
print(read_times)

#### Create Visualizations

library(ggplot2)

# Bar chart of BirthState distribution
ggplot(dataset, aes(x = BirthState)) +
  geom_bar(fill = "steelblue") +
  theme_minimal() +
  labs(title = "Distribution of Birth States", x = "State", y = "Count") +
  coord_flip()

# Histogram of Age distribution
ggplot(dataset, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "purple", color = "white") +
  theme_minimal() +
  labs(title = "Age Distribution", x = "Age", y = "Count")

# Boxplot of Income by Race
ggplot(dataset, aes(x = Race, y = Income, fill = Race)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Income Distribution by Race", x = "Race", y = "Income") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## Mapping with shapefiles

library(tigris)
library(sf)


# Load U.S. states shapefile from tigris
us_states <- states(cb = TRUE, year = 2023) %>% 
  st_as_sf()  # Convert to sf object

## Aggregate Data by BirthState

# Aggregate dataset by BirthState
state_counts <- dataset %>%
  group_by(BirthState) %>%
  summarise(count = n())

# Merge with shapefile using state abbreviations
us_states <- us_states %>%
  shift_geometry() %>%
  left_join(state_counts, by = c("STUSPS" = "BirthState")) 

# Replace NA counts with 0
us_states$count[is.na(us_states$count)] <- 0

## Create the Map Using ggplot2

ggplot(us_states) +
  geom_sf(aes(fill = count), color = "black") +
  scale_fill_viridis_c(option = "plasma") +
  theme_minimal() +
  labs(title = "Distribution of Birth States", fill = "Count")
