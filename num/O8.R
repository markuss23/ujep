f <- function(x){return (x*x*x-cos(x))}
fd <- function(x){return (3*x*x+(sin(x)))}

NewtonRoot <- function(f, fd, xstart, acc=0.000001){
  x <- xstart
  citac <- 0
  repeat{
    citac <- citac + 1
    dx <- f(x)/fd(x)
    x <- x-dx
    if(abs(dx) < acc) {
    print(citac)
    return(x)
    }
  }
}

NewtonRoot(f, fd, 0.5, 10**(-9))


NewtonRootVarB <- function(f, fd, xstart, acc=0.000001){
  x <- xstart
  h <- acc
  citac <- 0
  repeat{
    citac <- citac + 1
    dx <- h*f(x)/(f(x+h)-f(x))
    x <- x-dx
    if(abs(dx) < acc) {
      print(citac)
      return(x)
    }
  }
}

NewtonRootVarB(f, fd, 0.5, 10**(-9))



NewtonRootVarC <- function(f, fd, xstart, acc=0.000001){
  x <- xstart
  h <- acc
  citac <- 0
  repeat{
    citac <- citac + 1
    dx <- y*y/(f(x+y)-y)
    x <- x-dx
    if(abs(dx) < acc) {
      print(citac)
      return(x)
    }
  }
}

NewtonRootVarC(f, fd, 0.5, 10**(-9))


HalleySquareRoot <- function(a, acc=0.000001){
  x <- a
  citac <- 0
  repeat{
    citac <- citac + 1
    xx <- x*x
    dx <- (xx-a)*2*x/(3*xx+a)
    x <- x*dx
    if(abs(dx) < acc) {
      print(citac)
      return(x)
    }
  }
}


options(digits=20)
a <- 150
sqrt(a)
HalleySquareRoot


HornerNewton <- function(a, xstart, acc=0.000001){
  x <- xstart
  citac <- 0
  repeat{
    citac <- citac + 1
    dx <- f(x)/fd(x)
    x <- x-dx
    if(abs(dx) < acc) {
      print(citac)
      return(x)
    }
  }
}

