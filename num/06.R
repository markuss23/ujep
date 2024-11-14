f <- function(t, X) {
  # Define the function for damped oscillations
  return(c(X[2], -X[1] - 0.1 * X[2])) # Including damping term
}

Euler <- function(X, y, f, h) {
  return(y + h * f(X, y))
}

# Implementing the RK4 method
RK4 <- function(t, y, f, h) {
  k1 <- f(t, y)
  k2 <- f(t + h / 2, y + h / 2 * k1)
  k3 <- f(t + h / 2, y + h / 2 * k2)
  k4 <- f(t + h, y + h * k3)
  return(y + h / 6 * (k1 + 2 * k2 + 2 * k3 + k4))
}

# Implementing the RK2 method (Midpoint Method)
RK2 <- function(t, y, f, h) {
  k1 <- f(t, y)
  k2 <- f(t + h / 2, y + h / 2 * k1)
  return(y + h * k2)
}

# Simulation parameters
tMAX <- 100
n <- 1000
h <- tMAX / n
t <- seq(0, tMAX, h)
n <- n + 1

# Initial conditions
X <- matrix(0, nrow = n, ncol = 2)
X[1, 1] <- 1  # Initial position
X[1, 2] <- 10 # Initial velocity

# Euler method simulation
for (i in 2:n) {
  X[i, ] <- Euler(t[i - 1], X[i - 1, ], f, h)
}

# Plot for Euler method
plot(t, X[, 1], col = 'red', type = 'l', ylim = range(X), ylab = "Displacement", xlab = "Time")
title("Damped Oscillations: Euler Method")

# Runge-Kutta 4th order (RK4) simulation
Xrk4 <- matrix(0, nrow = n, ncol = 2)
Xrk4[1, 1] <- 1  # Initial position
Xrk4[1, 2] <- 10 # Initial velocity

for (i in 2:n) {
  Xrk4[i, ] <- RK4(t[i - 1], Xrk4[i - 1, ], f, h)
}

# Runge-Kutta 2nd order (RK2) simulation
Xrk2 <- matrix(0, nrow = n, ncol = 2)
Xrk2[1, 1] <- 1  # Initial position
Xrk2[1, 2] <- 10 # Initial velocity

for (i in 2:n) {
  Xrk2[i, ] <- RK2(t[i - 1], Xrk2[i - 1, ], f, h)
}

# Plot for RK2 and RK4 methods
plot(t, X[, 1], col = 'red', type = 'l', ylim = range(c(X, Xrk2, Xrk4)), ylab = "Displacement", xlab = "Time")
lines(t, Xrk2[, 1], col = 'green', lty = 2)
lines(t, Xrk4[, 1], col = 'blue', lty = 3)
legend("topright", legend = c("Euler", "RK2", "RK4"), col = c("red", "green", "blue"), lty = c(1, 2, 3))
title("Comparison of Euler, RK2, and RK4 Methods")
