# This activity will help understand the 

# Load necessary libraries
library(dplyr)
library(readr)
library(writexl)
library(arrow)
library(haven)      # for SAS
library(microbenchmark)   # for Timing
library(stringi)

# Step 1: Create a synthetic dataset
set.seed(42)                         # For reproducibility
n <- 1e6                             # Number of rows
state_abbreviations <- c(state.abb,  # Built-in vector of US state abbreviations
                         "DC")       # Add DC to state abbreviations  
                                               

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

# Aggregate dataset by BirthState
state_counts <- dataset %>%
  group_by(BirthState) %>%
  summarise(count = n())

# Merge with shapefile using state abbreviations
us_states <- us_states %>%
  shift_geometry() %>%     # Shift to match Census coordinates
  left_join(state_counts, by = c("STUSPS" = "BirthState")) 

## Create the Map Using ggplot2

ggplot(us_states) +
  geom_sf(aes(fill = count), color = "black") +
  scale_fill_viridis_c(option = "plasma") +
  theme_minimal() +
  labs(title = "Distribution of Birth States", fill = "Count")


# Make it more similar to our pop data

# Load necessary libraries

library(tidycensus)

# Get actual state populations from the Census API
#census_api_key("YOUR_CENSUS_API_KEY", install = TRUE, overwrite = TRUE)

state_pops <- get_acs(geography = "state", 
                      variables = "B01003_001", 
                      vintage = 2024) %>%
  select(NAME, population = estimate) %>%
  mutate(BirthState = state.abb[match(NAME, state.name)]) %>%
  filter(!is.na(BirthState))  # Remove territories not in state.abb

# Normalize populations to probabilities
state_pops2 <- state_pops %>%
  mutate(prob = population / sum(population))

# Generate BirthState using weighted probabilities
dataset2 <- dataset %>%
  mutate(BirthState = sample(state_pops2$BirthState, 
                             n, replace = TRUE, 
                             prob = state_pops2$prob))

# Aggregate dataset by BirthState
state_counts2 <- dataset2 %>%
  group_by(BirthState) %>%
  summarise(count = n())

# Merge with shapefile using state abbreviations
us_states2 <- us_states %>%
  filter(!STUSPS %in% c('GU', 'VI', 'PR', 'AS', 'MP')) %>% # filter territories
  shift_geometry() %>%                                     # Shift to match Census coordinates
  left_join(state_counts2, by = c("STUSPS" = "BirthState")) 

## Create the Map Using ggplot2

ggplot(us_states2) +
  geom_sf(aes(fill = desc(count.y)), color = "black") +
  scale_fill_viridis_c(option = "plasma") +
  theme_minimal() +
  labs(title = "Distribution of Birth States with Census Proportions", fill = "Count")

# Write out our shapefile

st_write(us_states2, "us_states.shp")