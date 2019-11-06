creditData <- read.csv("CreditData.csv")
View(creditData)

creditData.subset <- creditData[c('Status', "Duration" , "history" , "Purpose" , "amount" , "Savings" , "employment" , "Approved" , "Property" , "Housing" , "Age")]
View(creditData.subset)

set.seed(123)
myIndex <- sample(1:nrow(creditData.subset), 0.75*nrow(creditData.subset))

trainData <- creditData.subset [myIndex, ]
View(trainData)

testData <- creditData.subset [-myIndex, ]
View(testData)

install.packages("randomForest")
library(randomForest)

rf <- randomForest(
  Approved ~ . ,
  data = trainData
)
pred = predict(rf, newdata=testData[-21])
table (pred, testData$Approved)


