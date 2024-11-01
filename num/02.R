n <- 40
A <- matrix(runif(n*n, -1, 1), nrow=n)
b <- runif(n, -1, 1)

x <- numeric(n)

# GAUSS bez vektoritace
for(k in 1:10){
  for( i in 1:n){
    soucet <- 0
    for (j in 1:n){
      if(j!=i) soucet <- soucet + A[i,j]*x[j]
    }
    x[i] <- (b[i] - soucet)/A[i,i]
  }
  # print(x)
}
solve(A,b)

# GAUSS vektoritace

for(k in 1:10){
  for( i in 1:n){

    x[i] <- (b[i] - sum(A[i,]* x)+A[i,i]*x[i])/A[i,i]
  }
  # print(x)
}

# jacobiho s vektoirzaci
for(k in 1:20){
  for( i in 1:n){
    
    x[i] <- (b[i] - sum(A[i,]* x)+A[i,i]*x[i])/A[i,i]
  }
  # print(x)
}



