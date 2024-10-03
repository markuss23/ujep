rm(list=ls())
x<-2+0i
round(sqrt(cos(x+1.5*pi)),3)

(x+1.5*pi) |> cos() |> sqrt() |> round(3) -> y
cat(x,y)

text <- "Pomocí funkcí pro práci"
text <- "copak zlaTovláska ale JMELí!"
text<- tolower(text) 
substring(text,1,1) <- toupper(text) 
text <- gsub("jmelí", "Jmelí", text)


pole1<- c(1,2,3)
pole2<- c(3,4,5)
skalarni_soucin <- sum(pole1*pole2)

sqrt(sum(((pole2-pole1)**2)))
0:10/5-1

a <- -10:10
a[(a < 0 & a %% 2 == 1) | (a >= 0 & a %% 2 == 0)]

text <- "a b c d e a a "
text <- factor(scan(text = text, what = " "))
print(summary(text))