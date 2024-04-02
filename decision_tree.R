
install.packages("rJava")
install.packages("RWeka")
install.packages("partykit")

library(rJava)
library(RWeka)
library(partykit)


# Initialize Weka
Weka_control(wait = FALSE, verbose = FALSE)

# Load and view the iris dataset
data(iris)
View(iris)

# Check the structure and summary of the iris dataset
str(iris)
summary(iris)
attributes(iris)

# Build the J48 model
m1 <- J48(Species ~ ., data = iris)
print(m1)
summary(m1)
plot(m1)

#öngörü içi predict fonksiyonundan yararlanıcağız
#We will use the predict function for prediction

ongoru <- predict(m1)
ongoru[1:30]
#eğer fercek veriler ile ongoru sonuıcları birlikte gorulmek istenirse
#if you want to see real data and prediction results together
attach(iris)
data.frame(Species=Species,ongoru=ongoru)[1:150,]

#yeni bir iris ciceği verisi geldipinden hangi sınıfa gidicek tahmin edelim
#As new iris flower data arrives, let's guess which class it will go to.

yeni<-data.frame(Sepal.Length=4.1,Sepal.Width=3.2,Petal.Length=1.5,Petal.Width=1.2)

#bu yeni gözlem değerinin hangi tur olduğunu bulalım
#let's find out which round this new observation value is
predict(m1,yeni)
