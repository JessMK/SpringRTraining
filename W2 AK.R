# Week 2: Data Types & Structures Answer Key


# Exercise 1: Understanding Data Types

x <- 12.5  
y <- "R is fun!"  

class(x)  # Output: "numeric"  
class(y)  # Output: "character"  

as.character(x)  # Output: "12.5"  
as.factor(y)  # Output: Factor w/ 1 level: "R is fun!"  


# Exercise 2: Creating and Manipulating Lists

my_list <- list(1:5, c("Maryland", "Virginia", "Delaware"), c(TRUE, FALSE, TRUE))  

# Extract the second element  
my_list[[2]]  # Output: "Maryland", "Virginia", "Delaware" 

# Extract the third element and check its type  
third_element <- my_list[[3]]  
class(third_element)  # Output: "logical"  

# Exercise 3: Working with Data Frames

df <- data.frame(Name = c("Alice", "Bob", "Charlie", "David", "Eve"),  
                 Age = c(25, 30, 35, 40, 28),  
                 Satisfaction = c(85, 92, 78, 88, 95))  

# Extract Name and Satisfaction columns  
df[, c("Name", "Satisfaction")]  

# Filter rows where Satisfaction > 80  
subset(df, Satisfaction > 80)


# Exercise 4: Factors

factor_var <- factor(c("Low", "Medium", "High", "Low", "High"))  

# Check levels  
levels(factor_var)  # Output: "High" "Low" "Medium"  

# Reorder levels  
factor_reordered <- factor(factor_var, levels = c("High", "Medium", "Low"))  
levels(factor_reordered)  # Output: "High" "Medium" "Low"  


# Exercise 5: Coercion Rules

coercion_vec <- c(1, "R", TRUE)  
class(coercion_vec)  # Output: "character"  

# Explanation: Coercion happens because R converts all elements to the same type 
# (character in this case). 
# This follows the coercion hierarchy: character > numeric > logical. 