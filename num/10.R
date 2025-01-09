
fder <- function(f, x, h, n = 2) {
  # Compute initial derivatives for different step sizes
  h_seq <- h / 2^(0:(n-1))  # Sequence of halved step sizes
  res <- sapply(h_seq, function(h_i) (f(x + h_i) - f(x - h_i)) / (2 * h_i))  # Central differences
  
  # Perform Richardson extrapolation
  for (i in 2:n) {
    a <- 2^(2 * (i - 1))  # Factor for higher-order correction
    res <- (a * res[-1] - res[-length(res)]) / (a - 1)  # Extrapolated values
  }
  
  # Return the most refined result
  return(res[1])
}

MidPointRule <- function(f, a, b, n = 1){
  h <- (b-a)/n
  return(hsum(f(h(1:n)+a-h)))
}
MidPointRuleRichardson <- function(f, a, b, n =2){
  m <- n
  n <- 2(0:(1-n))
  res <- sapply(n, function(n) MidPointRule(f, a, b, n))
  for (i in 2:m) {
    a <- 2  (2i-2)
    res <- (ares[2:m]-res[1:(m-1)])/(a-1)
    m <- m-1
  }
  return(res)
}



Hermite = function(x0, x1, y0, y1, d0, d1){
  a = y0
  b = d0
  h = x1-x0
  h2 = h*h
  d = (h*(d1-d0)-2*(y1-y0)+2*d0*h)/(h*h2)
  c = (d1-d0-3*d*h2)/(2*h)
  return(
    c(
      a,
      b,
      c,
      d
    )
  )
}

Horner = function(coef, x, x0){
  x = x-x0
  return (((coef[4]*x + coef[3])*x+coef[2])*x+coef[1])
}

x0 = pi
x1 = 2*pi
y0 = cos(x0)
y1 = cos(x1)
d0 = -sin(x0)
d1 = -sin(x1)

plot(cos, xlim=c(x0,x1), col="red")
x = seq(x0, x1, 0.001)
lines(x,Horner(Hermite(x0, x1, y0, y1, d0, d1), x, x0), col="blue")

lines(x,Horner(Hermite(x0, x1, y0, y1, 1, d1), x, x0), col="green")

# derivace sin v pi/4
x = pi/4
print(cos(x))
print(fder(sin, x, 0.1, 4))


f <- function(x) x^2
a <- 0
b <- 1
n <- 10

result <- MidPointRule(f, a, b, n)
print(result)


a = 0
b = pi
MidPointRule(sin, a, b, 100)
mid_point_rule_richardson(cos, a,b,5)


