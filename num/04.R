phi = function(x){
  return(c(1,x,x*x))
}

coef = function(x, y, phi){
  M = sapply(x, phi)
  A = M %*% t(M) 
  b = c(M %*% y)
  return (solve(A,b))
}

x = seq(0,pi,0.1)
y  = sin(x)

plot(x,y)
#sapply(2:3, phi) %*% y
a = coef(x,y,phi)

xs = seq(0,pi,0.0001)

lines(xs, a %*% sapply(xs, phi), col="red")

x = seq(0,pi, 0.01)
y = sin(x) + 0.2*sin(16*x) + 0.01*0.2*sin(8*x)
plot(x,y)

phi = function(x){
  return (c(sin(x), sin(16*x)))
}

a = coef (x,y,phi)



xs = seq(0,2*pi,0.0001)

lines(xs, a %*% sapply(xs, phi), col="red")






