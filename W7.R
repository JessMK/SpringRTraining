# Week 7: Exploratory Data Analysis (EDA) and Descriptive Statistics

# This week focuses on techniques for exploring and summarizing data in R. 
# Students will use functions to describe data distributions, visualize patterns, and detect anomalies.

 
# Exercise 1: Summary Statistics with iris

# Load the iris dataset.

# Calculate the following statistics for each numeric column:
#   Mean, median, standard deviation, and interquartile range (IQR).

# Save these values in a summary table called iris_stats.


# Exercise 2: Detecting Missing Values

# Create a new dataset iris_missing by randomly introducing NA values to the Sepal.Length column in iris.

# Count the number of missing values in the dataset.

# Remove rows containing NA values and store the cleaned data as iris_cleaned.


# Exercise 3: Visualizing Distributions

# Use ggplot2 to create a histogram of Sepal.Length for the iris dataset.

# Add a density curve over the histogram to visualize the distribution more clearly.


# Exercise 4: Boxplots for Comparisons

# Create a boxplot of Sepal.Length grouped by Species.

# Customize the plot by adding appropriate axis labels and titles.


# Exercise 5: Outlier Detection

# Identify potential outliers in the mtcars dataset by calculating the z-scores for mpg.

# Filter the dataset to show rows where the z-score for mpg exceeds 2 or is less than -2.


# Show & Tell Bonus: Try Something New
# Create a custom visualization using ggplot2 that reveals insights 
# about either the iris or mtcars dataset.
# 
# What story does your visualization tell?
