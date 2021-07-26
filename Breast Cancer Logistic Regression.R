#Import Dataset into Dataframe:
DataSet <- read.csv("C:\\Users\\abdul\\Desktop\\R Programming\\Freestyle\\Breast Cancer\\Dataset\\breast_cancer.csv")
DataSet[DataSet$Class == 2, "Class"] <- 0
DataSet[DataSet$Class == 4, "Class"] <- 1

#Splitting the Dataset into a Training Set and a Data Set:
set.seed(0)
split <- sample(c(rep(0, 0.8*nrow(DataSet)),
                rep(1, 0.2*nrow(DataSet))))
train <- DataSet[split == 0,]
test <- DataSet[split == 1,]

#Training the Logistic Regression Model (on the training set):
model <- glm(Class ~ .-Sample.code.number, data = train, family = binomial)

#Predicting the Test Set Results:
prediction <- predict(model, newdata = test, type = "response")

#Making a Confusion Matrix:
pred.model <- ifelse(prediction>0.5, "Malignant", "Benign")
test$Class <- ifelse(test$Class == 1, "Malignant", "Benign")
cm <- table(pred.model, test$Class)
accuracy <- mean(pred.model == test$Class)

#Computing the Accuracy with k-Fold Cross Validation:
#I do not know how to do this in R. 

#Summary:
Summary <- list("Coefficients" = summary(model)$coef, "Confusion Matrix" = cm, "Accuracy" = accuracy)
Summary