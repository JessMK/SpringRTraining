# Week 3: Loops, Conditional Statements, and Functions Answer Key 


# Exercise 1: For Loops

# Print numbers 1 to 10  
for (i in 1:10) {  
  print(i)  
}  

# Multiply each number by 3  
vec <- c(2, 4, 6, 8, 10)  
for (num in vec) {  
  print(num * 3)  
}  

# Exercise 2: While Loops

# Print numbers from 5 to 0  
num <- 5  
while (num >= 0) {  
  print(num)  
  num <- num - 1  
}  

# Break when number reaches 2  
num <- 5  
while (num >= 0) {  
  if (num == 2) break  
  print(num)  
  num <- num - 1  
}  

# Exercise 3: Conditional Statements

x <- 15  

# If statement  
if (x > 10) {  
  print("x is greater than 10")  
}  

# If-else statement  
if (x > 10) {  
  print("x is greater than 10")  
} else {  
  print("x is less than or equal to 10")  
}  

# Ifelse on a vector  
vec <- c(3, 7, 12, 18, 5)  
ifelse(vec > 10, "Pass", "Fail")  
# Output: "Fail" "Fail" "Pass" "Pass" "Fail"  


# Exercise 4: Creating Functions

# Function to square a number  
square_num <- function(x) {  
  return(x^2)  
}  

square_num(4)  # Output: 16  
square_num(7)  # Output: 49  
square_num(9)  # Output: 81  

# Complex function  
complex_func <- function(x, y) {  
  return((x + y) * 5)  
}  

complex_func(2, 3)  # Output: 25  
complex_func(4, 6)  # Output: 50  
# Exercise 5: Apply Functions

matrix_1 <- matrix(1:9, nrow = 3)  

# Row sums using apply  
apply(matrix_1, 1, sum)  # Output: 6 15 24  

# Mean of each element in list  
list_1 <- list(1:3, 4:6, 7:9)  
lapply(list_1, mean)  # Output: 2 5 8  