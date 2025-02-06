# Week 4: Importing and Cleaning Data Answer Key


# Exercise 1: Reading Data into R

# Write and read the dataset  
write.csv(mtcars, "mtcars.csv", row.names = FALSE)  
cars_data <- read.csv("mtcars.csv")  

# Structure and summary  
str(cars_data)  
summary(cars_data)  


# Exercise 2: Data Cleaning Basics

# Replace NAs with 0  
cars_data[is.na(cars_data)] <- 0  

# Convert mpg to factor  
cars_data$mpg <- as.factor(cars_data$mpg)  
str(cars_data$mpg)  # Check result  

# Remove carb column  
cars_data <- cars_data[, !names(cars_data) %in% "carb"]  

# Rename hp to horsepower  
names(cars_data)[names(cars_data) == "hp"] <- "horsepower"  


# Exercise 3: Filtering and Selecting Data

# Filter rows  
subset(cars_data, mpg > 20)  

# Select columns  
cars_data_selected <- cars_data[, c("mpg", "horsepower", "wt")]  

# Arrange by descending mpg  
cars_data_sorted <- cars_data[order(-cars_data$mpg), ]  


# Exercise 4: Handling Missing Data

# Add random NA values to wt  
set.seed(42)  # For reproducibility  
cars_data$wt[sample(1:nrow(cars_data), 3)] <- NA  

# Remove rows with NAs  
cleaned_data <- cars_data[complete.cases(cars_data), ]  

# Use na.omit()  
cleaned_data_na_omit <- na.omit(cars_data)  
str(cleaned_data_na_omit)  


# Exercise 5: Exploring Data with Basic Visualizations

# Histogram of mpg  
hist(as.numeric(as.character(cars_data$mpg)), main = "Histogram of MPG", xlab = "MPG")  

# Scatterplot of mpg vs wt  
plot(as.numeric(as.character(cars_data$mpg)), cars_data$wt,  
     main = "MPG vs Weight", xlab = "MPG", ylab = "Weight")  

# Color scatterplot by gear  
library(ggplot2)  
ggplot(cars_data, aes(x = as.numeric(as.character(mpg)), y = wt, color = as.factor(gear))) +  
  geom_point() +  
  labs(title = "MPG vs Weight by Gear", x = "MPG", y = "Weight", color = "Gear")  