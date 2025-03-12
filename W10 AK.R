## Week 10: Introduction to ggplot2 for Data Visualization Answer Key

# Exercise 1: Creating Your First ggplot

library(ggplot2)

# Scatter plot for Sepal.Length vs Sepal.Width
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +  
  geom_point() +  
  labs(title = "Scatter Plot of Sepal Dimensions",  
       x = "Sepal Length",  
       y = "Sepal Width")


# Exercise 2: Exploring Geometries

ggplot(iris, aes(x = Petal.Length)) +  
  geom_histogram(bins = 20, fill = "skyblue") +  
  labs(title = "Histogram of Petal Lengths")


# Exercise 3: Faceting by Species

ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +  
  geom_point() +  
  facet_wrap(~ Species) +  
  labs(title = "Petal Dimensions by Species")


# Exercise 4: Adding Custom Themes

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +  
  geom_point() +  
  theme_minimal() +  
  labs(title = "Scatter Plot of Sepal Dimensions",  
       x = "Sepal Length",  
       y = "Sepal Width",  
       color = "Flower Type")


# Exercise 5: Combining Layers

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +  
  geom_point() +  
  geom_smooth(method = "lm", se = FALSE) +  
  labs(title = "Scatter Plot with Regression Line",  
       x = "Sepal Length",  
       y = "Sepal Width")