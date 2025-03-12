# Week 8: Data Wrangling and Cleaning Techniques

# This week focuses on cleaning messy data, handling missing values, 
# correcting data inconsistencies, and reshaping data using powerful R tools.
 
# Exercise 1: Cleaning Categorical Data in iris

# Convert Species in iris to lowercase values using mutate() and tolower().

# Remove duplicate rows from the dataset (if any).

# Ensure that the resulting dataset retains its original dimensions.


# Exercise 2: Handling Missing Data

# Create a modified version of iris named iris_na, introducing missing values in Sepal.Width.

# Impute missing values by replacing them with the mean of the column.


# Exercise 3: Data Reshaping with pivot_longer() and pivot_wider()

# Use pivot_longer() to convert the columns Sepal.Length, Sepal.Width, Petal.Length, and Petal.Width into long format.

# Name the new columns Measurement and Value.

# Use pivot_wider() to restore the dataset to its original structure.


# Exercise 4: Detecting and Removing Outliers

# Calculate the interquartile range (IQR) for Sepal.Length in iris.

# Identify and remove rows where Sepal.Length is more than 1.5 times the IQR below Q1 or above Q3.

# Save the cleaned dataset as iris_no_outliers.


# Exercise 5: String Manipulation in Data Cleaning

# Create a data frame state_data with two columns:
#   StateName: c("California", "texas ", " new york", "FLORIDA")

# Population: Random values between 1 and 10 million

# Clean up the StateName column by:
#   Removing leading/trailing spaces

# Converting names to proper capitalization (e.g., "California")


# Show & Tell: Try Something New
# 
# Explore a new data cleaning function (like separate() or unite()) 
# to clean messy datasets. 
# Share what you learned and how it could be useful in future work.
