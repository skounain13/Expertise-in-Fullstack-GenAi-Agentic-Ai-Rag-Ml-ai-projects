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

#SCALE THE DATA
from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
x_train=sc.fit_transform(x_train)
x_test=sc.transform(x_test)


#TRAIN THE MODEL X_TRAIN & Y_TRAIN
from sklearn.linear_model import LogisticRegression
classifier=LogisticRegression()
classifier.fit(x_train,y_train)

# TRAIN THE MODEL
y_pred=classifier.predict(x_test)

#confusion matrix
from sklearn.metrics import confusion_matrix
cm=confusion_matrix(y_test,y_pred)
print(cm)

#this is to get the models accuracy
from sklearn.metrics import accuracy_score
ac=accuracy_score(y_test, y_pred)
print(ac)

#This is to get the classification report
from sklearn.metrics import classification_report
cr=classification_report(y_test, y_pred)
cr

bias=classifier.score(x_train,y_train)
bias

variance=classifier.score(x_test,y_test)
variance

#FUTURE PREDICTION ON VALIDATION DATA

dataset1=pd.read_csv(r"C:\Users\LENOVO\Downloads\PYTHON-CHAPTER-1\Machine learning\CLASSIFICATION\logistic regression-1\final1.csv")
d2=dataset1.copy()
dataset1=dataset1.iloc[:,[3,4]].values

#feature scaling
from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
M=sc.fit_transform(dataset1)


y_pred1=pd.DataFrame()

d2['y_pred1']=classifier.predict(M)

d2.to_csv('finalpred.csv')

''' type in console
#to get the path
import os
os.getcwd()
'''

