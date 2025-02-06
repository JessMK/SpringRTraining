# Week 6: Advanced Data Transformation and Combining Datasets Answer Key


# Exercise 1: Grouped Operations in iris

library(dplyr)

# Load and group by Species  
data(iris)  
iris_summary <- iris %>%  
  group_by(Species) %>%  
  summarise(  
    mean_sepal_length = mean(Sepal.Length),  
    median_sepal_length = median(Sepal.Length)  
  )  

iris_summary  


# Exercise 2: Using case_when()

# Categorize Sepal.Size  
iris <- iris %>%  
  mutate(Sepal.Size = case_when(  
    Sepal.Length < 5 ~ "Small",  
    Sepal.Length >= 5 & Sepal.Length < 7 ~ "Medium",  
    Sepal.Length >= 7 ~ "Large"  
  ))  

# Count occurrences  
table(iris$Sepal.Size)  


# Exercise 3: Joins between Datasets

set.seed(42)  # For reproducibility  

# Add random CarType  
mtcars$CarType <- sample(c("Sedan", "SUV"), nrow(mtcars), replace = TRUE)  

# Create car_info table  
car_info <- data.frame(  
  CarType = c("Sedan", "SUV"),  
  FuelEfficiencyBonus = c(5, -3)  
)  

# Join tables  
combined_data <- mtcars %>%  
  inner_join(car_info, by = "CarType")  

head(combined_data)  


# Exercise 4: Pivoting and Reshaping Data (iris)

library(tidyr)

# Reshape iris into long format  
iris_long <- iris %>%  
  pivot_longer(cols = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),  
               names_to = "Measurement",  
               values_to = "Value")  

head(iris_long)  


#Exercise 5: Grouped Summaries with Two Datasets

# Grouped summaries for mtcars  
mtcars_summary <- mtcars %>%  
  group_by(cyl) %>%  
  summarise(mean_mpg = mean(mpg))  

# Grouped summaries for iris  
iris_species_summary <- iris %>%  
  group_by(Species) %>%  
  summarise(mean_sepal_length = mean(Sepal.Length))  

mtcars_summary  
iris_species_summary  