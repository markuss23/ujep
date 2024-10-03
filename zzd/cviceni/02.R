#rm(list=ls())

jmeno <- c("Petr", "Jan", "Andrea")
vek <- c(70, 8, 21)
studuje <- c(FALSE, FALSE, TRUE)
df <- data.frame(jmeno, vek, studuje)
df$jmeno
df[2]
df[[2]]


seznam <- list(1, "a", c(2, 3))
#přidání hodnoty do seznamu
#append(seznam, 4)

seznam[[4]]<-letters

kvadr <- function(a,b,c){
  d<-b*b-4*a*c
  if(d<0)d<-as.complex(d)
  pm<-c(-1,1)
  return((-b+pm*sqrt(d))/(2*a))
}
print(kvadr(1,2,3))

print(sapply(iris[1:4],mean))
print(sapply(iris[1:4],sd))
print(table(iris$Species))
A<-matrix(c(1,1,1,1), 2,2,byrow=TRUE)

