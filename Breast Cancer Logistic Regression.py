#Import Pandas Package:
import pandas as pd

#Import Dataset:
dataset = pd.read_csv('C:\\Users\\abdul\\Desktop\\Final Folder\\Dataset\\breast_cancer.csv')
#Matrix of Features/Independent Variables:
X = dataset.iloc[ : , 1:-1].values
#Dependent-Variable Vector:
y = dataset.iloc[ : , -1].values

#Splitting the Dataset into a Training Set and a Data Set:
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

#Training the Logistic Regression Model (on the training set):
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(random_state = 0)
classifier.fit(X_train, y_train)

#Predicting the Test Set Results:
y_pred = classifier.predict(x_test)

#Making a Confusion Matrix:
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)

#Computing the Accuracy with k-Fold Cross Validation:

from sklearn.model_selection import cross_val_score
