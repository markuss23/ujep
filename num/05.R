
# TAYLOR ROZVOJ

ExpTaylor = function(x, n=1){
  term = rep(1, length(x))
  
  res = term
  
  if (n>1){
    for (i in 2:n) {
      term = term * x / (i-1)
      res = res + term
    }
  }
  
  return (res)
}

a = -3
b = 3
x = seq(a,b, 0.001)
plot(exp, xlim = c(a, b), lwd=4)

for (i in 1:7) {
  lines(x, ExpTaylor(x, i), col=i+1)
}

#------------------------

# První derivace
FirstDerA <- function(f, x,h){return((f(x+h)-f(x))/h)}
# Druha
FirstDerB <- function(f, x,h){return((f(x+h)-f(x-h))/(2*h))}
SecondDer <- function(f, x, h) {
  return((f(x + h) - 2 * f(x) + f(x - h)) / h*h)
}
a = 0
b = 2*pi
plot(cos, xlim=c(a,b))
h=0.5
plot(function(x) FirstDerA(sin,x,h), xlim = c(a,b),col=2, add=TRUE)
plot(function(x) FirstDerB(sin,x,h), xlim = c(a,b),col=2, add=TRUE)
plot(function(x) SecondDer(sin,x,h), xlim = c(a,b),col="green", add=TRUE)


#plot(function(x) FirstDerA(sin,x,h) - cos(x), xlim = c(a,b),add=TRUE)
# --------------------

# MIDPOINT RULE


MIDPOINTRULE = function(f, a, b, n=1){
  h = (b-a)/n
  return (h*sum(f((1:n)*h +a-h*0.5)))
}

a = 0
b = pi

print(cos(a)- cos(b))
for (i in 1:10) {
  cat(MIDPOINTRULE(sin, a , b, i), "\n")
}
print(MIDPOINTRULE(sin, a, b), "\ns")


# SIMPSON RULE

Simson = function(f, a, b, n=1){
  h = (b-a)/n
  hpul = h/2
  
  suma = f(a) + f(b)
  
  xs = h * (1:n) + a - hpul
  
  suma = suma + sum(f(xs))
  if(n>1){
    xl = (xs + hpul)[-n]
    suma = suma + 2*sum(f(xl))
  }
  return (suma * h/6)
  
  }


for (i in 1:1000) {
  cat(Simson(sin, a , b, i), "\n")
}




Simson <- function(f, a, b, n=2) {
  if (n %% 2 == 1) {
    stop("Simpson's rule requires an even number of intervals.")
  }
  
  h <- (b - a) / n
  x <- seq(a, b, length.out = n + 1)
  
  suma <- f(a) + f(b) + 4 * sum(f(x[seq(2, n, by = 2)])) + 2 * sum(f(x[seq(3, n - 1, by = 2)]))
  
  return((h / 3) * suma)
}

# Define the interval
a <- 0
b <- pi

# Test for increasing n values
for (i in 2:20) {
  if (i %% 2 == 0) {
    cat(Simson(sin, a, b, i), "\n")
  }
}







