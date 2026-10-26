import numpy as np

import matplotlib.pyplot as plt

import pandas as pd

dataset=pd.read_csv(r"C:\Users\LENOVO\Downloads\PYTHON-CHAPTER-1\Machine learning\REGRESSION\ALL REG\emp_sal.csv")

x=dataset.iloc[:,1:2].values

y=dataset.iloc[:,2].values

#linear regression model

from sklearn.linear_model import LinearRegression
lin_reg=LinearRegression()
lin_reg.fit(x,y)

#Linear regression Visualization(here graph shows more error-not a good model)
plt.scatter(x,y,color='red')
plt.plot(x,lin_reg.predict(x),color='blue')
plt.title('Linear Regression Graph')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

#we build polynomial model(to get non linear line-to reduce error)

from sklearn.preprocessing import PolynomialFeatures
poly_reg=PolynomialFeatures(degree=5)
x_poly=poly_reg.fit_transform(x)

poly_reg.fit(x_poly,y)
lin_reg_2=LinearRegression()
lin_reg_2.fit(x_poly,y)

#polynomial visualizations (still not a good graph actual predicted not match)

plt.scatter(x, y,color='Red')
plt.plot(x,lin_reg_2.predict(poly_reg.fit_transform(x)),color='blue')
plt.title('Level or Salary(Polynomial Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

lin_model_pred=lin_reg.predict([[6.5]]) #it is should be in between 1500 to 200 as in dataset between 6&7
lin_model_pred

poly_model_pred=lin_reg_2.predict(poly_reg.fit_transform([[6.5]]))#it is good predicted in between the range
poly_model_pred

#SVR MODEL

from sklearn.svm import SVR
svr_reg=SVR(kernel='poly',degree=4,gamma='auto')
svr_reg.fit(x,y)

svr_model_pred=svr_reg.predict([[6.5]])
svr_model_pred
print(svr_reg.get_params())

#KNN REGRESSION:

from sklearn.neighbors import KNeighborsRegressor
knn_reg=KNeighborsRegressor(n_neighbors=2,p=2,weights='uniform',algorithm='auto')
knn_reg.fit(x,y)

#prediction
knn_reg_pred=knn_reg.predict([[6.5]])
knn_reg_pred
#Decision Tree Regression:(CART ALGORITHMS)

from sklearn.tree import DecisionTreeRegressor
dt_reg=DecisionTreeRegressor(criterion='absolute_error',splitter='best')
dt_reg.fit(x,y)  #becuase of random values chnages 

dt_reg_pred=dt_reg.predict([[6.5]])
dt_reg_pred

#random forest regression

from sklearn.ensemble import RandomForestRegressor
rf_reg=RandomForestRegressor(n_estimators=45,random_state=0,max_depth=None,max_samples=5,min_samples_leaf=2)
rf_reg.fit(x,y)

rf_reg_pred=rf_reg.predict([[6.5]])
rf_reg_pred

#xg boost:
    
import xgboost as xg
xgb_r=xg.XGBRegressor(objective='reg:linear',n_estimators=4)
xgb_r.fit(x,y)

#prediction:
    
xgb_reg_pred=xgb_r.predict([[6.5]])
xgb_reg_pred














