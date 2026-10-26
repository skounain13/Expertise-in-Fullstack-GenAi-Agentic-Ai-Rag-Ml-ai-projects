import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#IMPORT DATASET

dataset=pd.read_csv(r"C:\Users\LENOVO\Downloads\PYTHON-CHAPTER-1\Machine learning\CLASSIFICATION\logistic regression-1\logit classification.csv")

# SPLIT WITH IV $ DV
x=dataset.iloc[:,[2,3]].values
y=dataset.iloc[:,-1].values

# 80-20 TRAIN TEST SPLIT
from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=0)


#Feature scaling
from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
x_train=sc.fit_transform(x_train)
x_test=sc.transform(x_test)

# Training the KNN model on the training set
from sklearn.neighbors import KNeighborsClassifier
classifier_knn=KNeighborsClassifier()
classifier_knn.fit(x_train,y_train)

#predicting the test set results
y_pred=classifier_knn.predict(x_test)

#Making confusion matrix
from sklearn.metrics import confusion_matrix
cm=confusion_matrix(y_test,y_pred)
print(cm)

#accuracy score
from sklearn.metrics import accuracy_score
ac=accuracy_score(y_test, y_pred)
print(ac)

#bias
bias=classifier_knn.score(x_train,y_train)
bias

#variance
variance=classifier_knn.score(x_test,y_test)
variance
