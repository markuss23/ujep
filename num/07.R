# exp(x) from 0 to 1; 

Horner= function(a, x){
  b = length(a)
  res = a[n]
  if (n > 1) {
    for (i in (n-1):1) {  # Loop from the second-to-last coefficient to the first
      res <- res * x + a[i]
    }
  }
  
  return(res)
}

AnalInterPol = function(coef, a, b){
  n = length(coef)
  coef = coef /(1:n)
  res = a*Horner(coef, b)- a*Horner(coef, a)
  return (res)
}

InteStredniHnoda = function(f,a,b, N){
  return (mean(f(runif(N, a, b))) *(b-a))
  
}

InteGeometricka = function(f,a,b, h, N){
  x = runif(N,a,b)
  y = runif(N,0,h)
  
 
  
  return ( (b-a)*h*sum(y < f(x)) / N)
  
}


InteStredniHnodaSym = function(f,a,b, N){
  x = runif(N,a ,b)
  
  return (0.5*mean(f(x)+f(a-b-x))*(b-a))
  
}


Gaussq2 = function(f, a, b){
  x1= 1/sqrt(3)
  x = c(x1, -x1)
  sklon  = (b-a)*0.5
  
  return (sum(f(x* sklon + 0.5*(a+b)))*sklon)
  
  
}

GaussQ3 <- function(f, a, b){
  x1 <- sqrt(0.6)
  x <- c(x1, -x1, 0)
  sklon <- 0.5*(b-a)
  y <- f(x*sklon+0.5*(a+b))
  res <- (y[1]+y[2])*5/9+y[3]*8/9
  return (res*sklon)
  
}

print(InteStredniHnoda(exp, 0, 1, 1000))
print(exp(1)-1)


N = 1000
res = replicate(1000,InteStredniHnoda(exp, 0, 1,N))

print(mean(res))
print(sd(res))

N = 4000
res = replicate(1000,InteStredniHnoda(exp, 0, 1,N))
print("--")
print(mean(res))
print(sd(res))



N = 1000
res = replicate(1000,InteGeometricka(exp, 0, 1,3, N))

print(mean(res))
print(sd(res))

N = 4000
res = replicate(1000,InteGeometricka(exp, 0, 1,3,N))
print("--")
print(mean(res))
print(sd(res))


N = 1000
res = replicate(1000,InteStredniHnodaSym(exp, 0, 1,N))

print(mean(res))
print(sd(res))

N = 4000
res = replicate(1000,InteStredniHnodaSym(exp, 0, 1,N))
print("--")
print(mean(res))
print(sd(res))




print("asdasdasd")


print(Gaussq2(exp, 0, 1))
print(GaussQ3(exp, 0, 1))
