# Week 7: Exploratory Data Analysis (EDA) and Descriptive Statistics Answer Key
# Exercise 1: Summary Statistics with iris

library(dplyr)

# Load data  
data(iris)  

# Calculate summary statistics  
iris_stats <- iris %>%  
  summarise(  
    mean_sepal_length = mean(Sepal.Length),  
    median_sepal_length = median(Sepal.Length),  
    sd_sepal_length = sd(Sepal.Length),  
    iqr_sepal_length = IQR(Sepal.Length)  
  )  

iris_stats  

# Exercise 2: Detecting Missing Values

set.seed(42)  

# Introduce missing values  
iris_missing <- iris  
iris_missing$Sepal.Length[sample(1:nrow(iris), 5)] <- NA  

# Count missing values  
sum(is.na(iris_missing$Sepal.Length))  

# Remove rows with NAs  
iris_cleaned <- na.omit(iris_missing)  

head(iris_cleaned)  

# Exercise 3: Visualizing Distributions

library(ggplot2)

# Histogram with density  
ggplot(iris, aes(x = Sepal.Length)) +  
  geom_histogram(aes(y = ..density..), bins = 15, fill = "lightblue", color = "black") +  
  geom_density(color = "darkblue") +  
  labs(title = "Distribution of Sepal Length", x = "Sepal Length", y = "Density")  

# Exercise 4: Boxplots for Comparisons

# Boxplot of Sepal.Length by Species  
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +  
  geom_boxplot() +  
  labs(title = "Sepal Length by Species",  
       x = "Species",  
       y = "Sepal Length") +  
  theme_minimal()  

# Exercise 5: Outlier Detection

# Calculate z-scores for mpg  
mtcars <- mtcars %>%  
  mutate(z_mpg = (mpg - mean(mpg)) / sd(mpg))  

# Filter potential outliers  
outliers <- mtcars %>%  
  filter(z_mpg > 2 | z_mpg < -2)  

outliers  