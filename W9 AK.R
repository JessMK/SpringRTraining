## Week 9: Advanced Data Manipulation with dplyr and Exploratory Data Analysis Answer Key

# Exercise 1: Filtering Data in iris

library(dplyr)

# Filter rows with Petal.Length > 4 and select specific columns  
iris_filtered <- iris %>%  
  filter(Petal.Length > 4) %>%  
  select(Species, Sepal.Length, Petal.Length)  

head(iris_filtered)


# Exercise 2: Grouping and Summarizing Data

iris_summary <- iris %>%  
  group_by(Species) %>%  
  summarize(  
    mean_sepal_width = mean(Sepal.Width),  
    sd_sepal_width = sd(Sepal.Width)  
  )  

print(iris_summary)


# Exercise 3: Arranging Data by Multiple Columns

iris_sorted <- iris %>%  
  arrange(Species, desc(Sepal.Length))  

head(iris_sorted, 10)


# Exercise 4: Exploring Summary Statistics for EDA

# Compute individual statistics  
min_val <- min(iris$Sepal.Length)  
max_val <- max(iris$Sepal.Length)  
mean_val <- mean(iris$Sepal.Length)  
median_val <- median(iris$Sepal.Length)  
var_val <- var(iris$Sepal.Length)  

print(c(min_val, max_val, mean_val, median_val, var_val))  

# Compare with summary()  
summary(iris$Sepal.Length)


# Exercise 5: Using mutate() for Derived Columns

iris_extended <- iris %>%  
  mutate(Petal.Ratio = Petal.Length / Petal.Width) %>%  
  filter(Petal.Ratio > 2)  

head(iris_extended)