
## Week 8 Answer Key
# Exercise 1: Cleaning Categorical Data in iris

library(dplyr)

# Convert Species to lowercase and remove duplicates  
iris_clean <- iris %>%  
  mutate(Species = tolower(Species)) %>%  
  distinct()  

# Check dimensions  
dim(iris_clean)  

# Exercise 2: Handling Missing Data

set.seed(123)

# Create iris_na with missing values  
iris_na <- iris  
iris_na$Sepal.Width[sample(1:nrow(iris_na), 5)] <- NA  

# Impute missing values with the column mean  
iris_na <- iris_na %>%  
  mutate(Sepal.Width = ifelse(is.na(Sepal.Width), mean(Sepal.Width, na.rm = TRUE), Sepal.Width))  

head(iris_na)  


# Exercise 3: Data Reshaping with pivot_longer() and pivot_wider()

library(tidyr)

# Pivot to long format  
iris_long <- iris %>%  
  pivot_longer(cols = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),  
               names_to = "Measurement",  
               values_to = "Value")  

head(iris_long)  

# Restore to wide format  
iris_wide <- iris_long %>%  
  pivot_wider(names_from = Measurement, values_from = Value)  

head(iris_wide)  

# Exercise 4: Detecting and Removing Outliers

# Calculate IQR  
Q1 <- quantile(iris$Sepal.Length, 0.25)  
Q3 <- quantile(iris$Sepal.Length, 0.75)  
IQR_sepal <- IQR(iris$Sepal.Length)  

# Define bounds  
lower_bound <- Q1 - 1.5 * IQR_sepal  
upper_bound <- Q3 + 1.5 * IQR_sepal  

# Remove outliers  
iris_no_outliers <- iris %>%  
  filter(Sepal.Length >= lower_bound & Sepal.Length <= upper_bound)  

dim(iris_no_outliers)  

# Exercise 5: String Manipulation in Data Cleaning

# Create data frame  
state_data <- data.frame(  
  StateName = c("California", "texas ", " new york", "FLORIDA"),  
  Population = sample(1:10 * 1e6, 4)  
)  

library(stringr)

# Clean StateName  
state_data <- state_data %>%  
  mutate(StateName = str_trim(StateName),  
         StateName = str_to_title(StateName))  

state_data  