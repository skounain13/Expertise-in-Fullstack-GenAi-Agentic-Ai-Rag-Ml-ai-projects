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

# Training the Random forest model on the training set
from sklearn.ensemble import RandomForestClassifier
classifier=RandomForestClassifier(max_depth=4,n_estimators=30,criterion='entropy',random_state=0)
classifier.fit(x_train,y_train)

#predicting the test set results
y_pred=classifier.predict(x_test)

#Making confusion matrix
from sklearn.metrics import confusion_matrix
cm=confusion_matrix(y_test,y_pred)
print(cm)

#accuracy score
from sklearn.metrics import accuracy_score
ac=accuracy_score(y_test, y_pred)
print(ac)

#bias
bias=classifier.score(x_train,y_train)
bias

#variance
variance=classifier.score(x_test,y_test)
variance

