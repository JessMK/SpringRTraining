# Week 5: Data Transformation with dplyr Assignment


# This week focuses on introducing students to dplyr functions, 
# a cornerstone of tidy data transformation in R. 
# You will learn key verbs like filter(), select(), mutate(), arrange(), and summarize().


# Exercise 1: Filtering Rows

# Load the mtcars dataset using data(mtcars).

# Filter rows where mpg > 25 and cyl == 4.

# Save this filtered data to an object called high_mpg_cars.


# Exercise 2: Selecting Columns

# Select only the columns mpg, cyl, wt, and gear.

# Save the result as selected_cars.


# Exercise 3: Creating New Columns

# Create a new column power_to_weight by dividing hp by wt.

# Create another column efficient that is TRUE if mpg > 20, otherwise FALSE.


# Exercise 4: Arranging Rows

# Arrange the dataset by mpg in descending order.

# Break ties by wt in ascending order.


# Exercise 5: Summarizing Data

# Group the data by cyl and calculate the mean mpg and mean hp.

# Use summarise() to display these grouped summaries.


# Show & Tell Bonus: Try Something New
# Experiment with another dplyr function (like case_when() or across()) and share your code.
# What new skill did you learn? How could it be applied to your data own projects?