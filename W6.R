# Week 6: Advanced Data Transformation and Combining Datasets

# This week expands on dplyr with advanced transformations, grouping, and operations across datasets. 
# You'll also explore the iris dataset alongside mtcars.

 
# Exercise 1: Grouped Operations in iris

# Load the iris dataset using data(iris).

# Group the dataset by Species.

# Calculate the mean and median Sepal.Length for each species.

# Save the result as iris_summary.


# Exercise 2: Using case_when()

# Create a new column in iris named Sepal.Size:

# Label as "Small" if Sepal.Length < 5, "Medium" if 5 <= Sepal.Length < 7, and "Large" if Sepal.Length >= 7.

# Count the number of occurrences for each Sepal.Size category.


# Exercise 3: Joins between Datasets

# Add a column CarType to mtcars containing random values "Sedan" or "SUV".

# Create a data frame car_info with columns CarType and FuelEfficiencyBonus (Sedan = 5, SUV = -3).

# Use an inner join to combine mtcars and car_info by CarType.


# Exercise 4: Pivoting and Reshaping Data (iris)

# Use pivot_longer() from tidyr to reshape the columns Sepal.Length, Sepal.Width, Petal.Length, and Petal.Width into a long format.

# Name the resulting columns Measurement and Value.


# Exercise 5: Grouped Summaries with Two Datasets

# Compare the means of mpg in mtcars and Sepal.Length in iris grouped by Species.

# Save your results into separate grouped summary tables.


# Show & Tell Bonus: Try Something New
# Explore another transformation or joining function, such as
# (left_join(), full_join(), or pivot_wider()) and share your code.
# What was your experiment, and how could it help your future data work?
