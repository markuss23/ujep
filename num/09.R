g = function(x){return (0.5*(x+2/x))}

x =seq(0, 4, 0.001)

plot(x, g(x), ylim=c(0,3),type='l', col='blue')

abline(a=0, b=1, col="red")

x = 0.5
for (i in 1:10) {
  y=g(x)
  segments(x, x, x, y, col="green")
  segments(x, y, y, y, col="green")
  x = y
  print(x)
}


plot(cos, xlim = c(0,pi/3))
abline(a=0, b=1, col="red")

x = 0.1
for (i in 1:10) {
  y=cos(x)
  segments(x, x, x, y, col="green")
  segments(x, y, y, y, col="green")
  x = y
  print(x)
}

f = function(y) {
  ds = beta * y[1] * y[2]
  dI = nu * y[2]
  return (c(-ds, ds - dI, dI)) # Correct the recovery term for SIR
}

g = function(h, f, y0) {
  # Heun's method (improved Euler)
  y1 = y0 + h * f(y0)
  y1 = y0 + (h / 2) * (f(y0) + f(y1)) # Improved step
  return (y1)
}

nrow = 100
ncol = 3

SIR = matrix(0, nrow, ncol)
SIR[1, ] = c(999, 1, 0) # Initial population

beta = 0.001 # Adjust to avoid overly rapid dynamics
nu = 0.1
h = 1
for (i in 2:nrow) {
  SIR[i, ] = g(h, f, SIR[i - 1, ])
}

i = 1:nrow

plot(i, SIR[, 1], type = "l", ylim = c(0, 1000), col = "blue", ylab = "Population", xlab = "Time")
lines(i, SIR[, 2], col = "red")
lines(i, SIR[, 3], col = "green")
legend("right", legend = c("Susceptible", "Infectious", "Recovered"), col = c("blue", "red", "green"), lty = 1)



f = function(y) {
  return (c(
    y[1] * (r - a * y[2]),    # Prey growth rate
    y[2] * (-s + b * y[1])    # Predator growth rate
  ))
}

g = function(h, f, y0) {
  # Heun's method (improved Euler)
  y1 = y0 + h * f(y0)
  y1 = y0 + (h / 2) * (f(y0) + f(y1)) # Improved step
  return (y1)
}

nrow = 5000
ncol = 2

LV = matrix(0, nrow, ncol)
LV[1, ] = c(10, 10) # Initial populations: Prey and Predator

# Parameters
r = 1   # Prey growth rate
s = 1   # Predator death rate
a = 1 # Predation rate
b = 1 # Predator reproduction rate
h = 0.01 # Time step size

# Run the simulation
for (i in 2:nrow) {
  LV[i, ] = g(h, f, LV[i - 1, ])
}

i = 1:nrow

# Plot the results
plot(i, LV[, 1], type = "l", ylim = c(0, max(LV)), col = "blue", ylab = "Population", xlab = "Time")
lines(i, LV[, 2], col = "red")
legend("topright", legend = c("Prey", "Predator"), col = c("blue", "red"), lty = 1)

#plot(LV[, 1], LV[,2])
