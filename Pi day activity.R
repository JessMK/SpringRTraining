# Pi Day R Activity: Estimating Pi with Random Points (Monte Carlo Method)

#This activity introduces Pi using random sampling and visualization

# Load necessary packages
library(ggplot2)

# Set the number of random points
n <- 500  # You can adjust this! Increase the size and see how the visualization adjusts

# Generate random x and y points between -1 and 1
set.seed(314)  # Pi-themed seed for reproducibility
x <- runif(n, -1, 1)
y <- runif(n, -1, 1)

# Check if the points are inside the unit circle (x^2 + y^2 <= 1)
inside_circle <- x^2 + y^2 <= 1

table(inside_circle)

# Estimate Pi using the ratio of points inside the circle to total points
pi_estimate <- sum(inside_circle) / n * 4

print(pi_estimate, digits = 22)  # no greater than 22 are possible

# Create a data frame for visualization
pi_data <- data.frame(x, y, inside_circle)

# Plot the points and the circle
ggplot(pi_data, aes(x, y, color = inside_circle)) +
  geom_point(alpha = 0.5) +
  scale_color_manual(values = c("red", "blue")) +
  coord_fixed() +
  labs(title = paste("Estimating Pi using Monte Carlo Method: π ≈", round(pi_estimate, 4)),
       subtitle = paste("Points Used:", n),
       color = "Inside Circle?") +
  theme_minimal()
