# Week 5: Data Transformation with dplyr Answer Key


# Exercise 1: Filtering Rows

library(dplyr)

# Load data and filter  
data(mtcars)  
high_mpg_cars <- mtcars %>%  
  filter(mpg > 25, cyl == 4)  

high_mpg_cars 

# Exercise 2: Selecting Columns

# Select columns  
selected_cars <- mtcars %>%  
  select(mpg, cyl, wt, gear)  

selected_cars  

# Exercise 3: Creating New Columns

# Add new columns  
mtcars <- mtcars %>%  
  mutate(power_to_weight = hp / wt,  
         efficient = mpg > 20)  

head(mtcars)  

# Exercise 4: Arranging Rows

# Arrange data  
sorted_cars <- mtcars %>%  
  arrange(desc(mpg), wt)  

head(sorted_cars) 

# Exercise 5: Summarizing Data

# Summarize data by group  
summary_stats <- mtcars %>%  
  group_by(cyl) %>%  
  summarise(mean_mpg = mean(mpg), mean_hp = mean(hp))  

summary_stats  