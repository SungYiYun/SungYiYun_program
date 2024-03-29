# -*- coding: utf-8 -*-
"""FP_Classification_Building_SVC.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1qc8uPvHl9kPHimi0iyvHWf_ubuQkVM5g
"""

#匯入套件
import numpy as np
import pandas as pd
import pickle

from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.pipeline import Pipeline

import warnings
warnings.filterwarnings('ignore')

#匯入資料
X_org = pd.read_csv("X_df.csv",index_col=0)
y_org = pd.read_csv("y_df.csv",index_col=0)

X_org.shape,y_org.shape

#資料分割，分成train和test
X_train_org, X_test_org = train_test_split(X_org, test_size = 0.2,random_state = 1)
y_train_org, y_test_org = train_test_split(y_org, test_size = 0.2,random_state = 1)

#選取train及test標籤為經緯度
X_train = np.array(X_train_org)
y_train = y_train_org[['BUILDINGID']]

X_test = np.array(X_test_org)
y_test = y_test_org[['BUILDINGID']]

X_train.shape,y_train.shape,X_test.shape,y_test.shape

import seaborn as sns
sns.distplot(y_train[['BUILDINGID']],kde=False)

#SMOTE
from imblearn.over_sampling import SMOTE
X_train_smote, y_train_smote = SMOTE(random_state=42).fit_resample(X_train, y_train)

X_train_smote.shape,y_train_smote.shape,X_test.shape,y_test.shape

sns.distplot(y_train_smote[['BUILDINGID']],kde=False)

#SVC模型訓練
from sklearn.svm import SVC
clf_svc = SVC()

#SVC參數設置

grid_param_svc = {
    'C': [0.01, 0.1, 1],
    'kernel': ['linear', 'rbf', 'sigmoid'],
    'degree': [2,3,4]
}

#網格搜尋和交叉驗證
#使用K=5
from sklearn.model_selection import GridSearchCV

grid_search_svc = GridSearchCV(estimator=clf_svc, param_grid=grid_param_svc, cv=5, scoring='accuracy')

#找出最佳參數組合-網格搜尋
grid_search_svc.fit(X_train_smote, y_train_smote)

#最佳參數組合得出的R2
grid_search_svc.best_score_

#網格搜尋結果
grid_search_svc.cv_results_

#網格搜尋結果(表格顯示)
pd.DataFrame(grid_search_svc.cv_results_)

#最佳參數組合
grid_search_svc.best_params_

#績效指標
from sklearn.metrics import accuracy_score
from sklearn.metrics import precision_score
from sklearn.metrics import recall_score
from sklearn.metrics import f1_score
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix

import itertools
import matplotlib.pyplot as plt

print("SVC_SMOTE")
#訓練模型
clf_svc_n = SVC(C=0.01, degree=2, kernel='linear')
clf_svc_n.fit(X_train_smote, y_train_smote)
print("訓練模型-SVC")

#預測資料
y_predict_test_svc = clf_svc_n.predict(X_test)
print("預測資料-SVC")

#績效評估
print("績效評估-SVC")
print("訓練資料-SVC")
print("accuracy score:", accuracy_score(y_test,y_predict_test_svc))
print("precision score:", precision_score(y_test,y_predict_test_svc, average='micro'))
print("recall score:", recall_score(y_test,y_predict_test_svc, average='micro'))
print("f1 score:", f1_score(y_test,y_predict_test_svc, average='micro'))
print("report:\n",classification_report(y_test,y_predict_test_svc))

def plot_confusion_matrix(cm, classes,
                          normalize=False,
                          title='Confusion matrix',
                          cmap=plt.cm.Blues):
    """
    This function prints and plots the confusion matrix.
    Normalization can be applied by setting `normalize=True`.
    """
    if normalize:
        cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
        print("Normalized confusion matrix")
    else:
        print('Confusion matrix, without normalization')

    print(cm)

    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title)
    plt.colorbar()
    tick_marks = np.arange(len(classes))
    plt.xticks(tick_marks, classes, rotation=45)
    plt.yticks(tick_marks, classes)

    fmt = '.2f' if normalize else 'd'
    thresh = cm.max() / 2.
    for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
        plt.text(j, i, format(cm[i, j], fmt),
                 horizontalalignment="center",
                 color="white" if cm[i, j] > thresh else "black")

    plt.ylabel('True label')
    plt.xlabel('Predicted label')
    plt.tight_layout()

target_names = [0,1,2]
cnf_matrix = confusion_matrix(y_test,y_predict_test_svc)
plot_confusion_matrix(cm=cnf_matrix, classes=target_names, normalize='False', title='Predict Building_SVC_SMOTE')

plt.show

print("SVC")
#訓練模型
clf_svc_nosmote = SVC(C=0.01, degree=2, kernel='linear')
clf_svc_nosmote.fit(X_train, y_train)
print("訓練模型-SVC")

#預測資料
y_predict_test_svc = clf_svc_nosmote.predict(X_test)
print("預測資料-SVC")

#績效評估
print("績效評估-SVC")
print("訓練資料-SVC")
print("accuracy score:", accuracy_score(y_test,y_predict_test_svc))
print("precision score:", precision_score(y_test,y_predict_test_svc, average='micro'))
print("recall score:", recall_score(y_test,y_predict_test_svc, average='micro'))
print("f1 score:", f1_score(y_test,y_predict_test_svc, average='micro'))
print("report:\n",classification_report(y_test,y_predict_test_svc))

target_names = [0,1,2]
cnf_matrix = confusion_matrix(y_test,y_predict_test_svc)
plot_confusion_matrix(cm=cnf_matrix, classes=target_names, normalize='False', title='Predict Building_SVC')

plt.show

