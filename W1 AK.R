# Week 1: R Basics and Matrices Answer Key

# Exercise 1: Arithmetic Operations

125 + 375 

289 - 47 

750 / 15 

17 %% 5 

(10 + 20) * (15 - 5) / (2^3) 

# Exercise 2: Variables and Vector Operations

x <- 100  
y <- 50  
vector <- 1:10  

# Add 5 to every element  

vector + 5  # Output: 6 7 8 9 10 11 12 13 14 15  

# Multiply each element by 3 

vector * 3  # Output: 3 6 9 12 15 18 21 24 27 30  

# Extract elements from positions 3 to 7  

vector[3:7]  # Output: 3 4 5 6 7  


# Exercise 3: Comparison Operations

nums <- c(2, 4, 6, 8, 10)  

# Elements greater than 5  
nums[nums > 5]  # Output: 6 8 10  

# Elements less than or equal to 4  
nums[nums <= 4]  # Output: 2 4  

# Exercise 4: Matrix Creation and Operations

# Create a 3x3 matrix  
matrix_1 <- matrix(1:9, nrow = 3, byrow = TRUE)  
matrix_1  

# Add 10 to each element  
matrix_1 + 10  

# Output:  
#      [,1] [,2] [,3]  
# [1,]   11   12   13  
# [2,]   14   15   16  
# [3,]   17   18   19  

# Row sums and column sums  
rowSums(matrix_1)  # Output: 6 15 24  
colSums(matrix_1)  # Output: 12 15 18  

# Extract element from 2nd row, 3rd column  
matrix_1[2, 3]  # Output: 6  

# Select entire 1st column  
matrix_1[, 1]  # Output: 1 4 7


# Exercise 5: Factor Matrices

# Create a factor  
levels_vec <- c("High", "Medium", "Low", "High", "Low")  
factors <- factor(levels_vec)  

# Display the levels  
levels(factors)  # Output: "High" "Low" "Medium"  

# Create a 2x3 factor matrix  
factor_matrix <- matrix(factors, nrow = 2)  
factor_matrix  

# Explanation: When factors are printed, they display as integers representing  
# factor levels, rather than their actual text representation.
