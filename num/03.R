Lagrange = function(t, x, y){
 n = length(x)
  suma = 0
  for(i in 1:n){
    nasobic = 1
   for (j in 1:n) {
     if ( j != i) nasobic = nasobic *(t-x[j]) / (x[i]-x[j])
     
     
   }
    suma = suma + y[i] * nasobic
  } 
  return(suma)
}

Vandemonde = function(x, y) {
  n = length(x)
  A = matrix(1, nrow = n, ncol = n)
  for (j in 2:n) {
    A[, j] = A[, j - 1] * x  # Fix column generation
  }
  # Check condition number
  if (kappa(A) > 1e12) {
    stop("Vandermonde matrix is ill-conditioned.")
  }
  return(solve(A, y))
}

Horner = function(x, coef){
  n = length(coef)
  
  res = coef[n]
  
  for (i in (n-1):1) {
    res = res*x+coef[i]
    
  }
  return (res)
}

NewtonPolCoef = function(x, y) {
  n = length(x)
  coef = y  # Initialize with the y values (first column of divided differences)
  
  # Compute divided differences
  for (i in 2:n) {
    for (j in n:i) {
      coef[j] = (coef[j] - coef[j - 1]) / (x[j] - x[j - (i - 1)])
    }
  }
  return(coef)
}

# Evaluate the Newton polynomial at a given value t
NewtonEval = function(t, x, coef) {
  n = length(coef)
  res = coef[n]
  
  for (i in (n - 1):1) {
    res = res * (t - x[i]) + coef[i]
  }
  return(res)
}

n = 100
x =  runif(n)
y = runif(n)

plot(x, y,col="red")

t = seq(0, 1, 0.001)
lines(t, Lagrange(t, x, y))

#print(Vandemonde(x, y))
#lines(t, Horner(t, Vandemonde(x,y)), col="blue")

coef_newton = NewtonPolCoef(x, y)
lines(t, NewtonEval(t, x, coef_newton), col = "green")


