# -*- coding: utf-8 -*-
"""FP_DataPreProcessing_Test.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1pD8Hu5b_e2EmS5kuXOfWmWBCPeiIOIc9
"""

#匯入套件
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
import seaborn as sns

#載入資料
original_data = pd.read_csv("trainingData.csv")

#檢視original原始資料中的前5筆資料
original_data.head()

#檢視original原始資料的基本統計分析
original_data.describe()

#將original原始資料分成特徵(X)和標籤(y)
X = original_data.iloc[:,:520]

y = original_data.iloc[:,520:526]

#original特徵的筆數
X.shape

#將超出AP範圍的值替換成nan，以避免干擾對AP範圍內RSSI分佈的分析
X = (X.replace(to_replace=100,value=np.nan))

#查看WAP001到WAP520中RSSI值分布情況
X_stack = X.stack(dropna=False)
sns.distplot(X_stack.dropna(),kde = False)

#有多少缺失值(百分比)
# Proportion of out of range values
sum(X_stack.isnull() == 0)/len(X_stack)

waps_in_range = (X.notnull().sum(axis = 1))

fig, ax = plt.subplots(1,1)

sns.violinplot(waps_in_range, ax = ax)
ax.set_xlabel("Number of APs in range")

#檢視WAP在範圍內資料的基本統計分析
waps_in_range.describe()

'''
有趣的是，大多數樣本的範圍內有超過 13 個 AP，最多有 51 個 AP。 
我們確實觀察了一些範圍內有 0 個 AP 的訓練樣本。 
讓我們從訓練數據中刪除這些樣本。
'''

#刪除在WAP001到WAP520中有0的訓練樣本
print("Before sample removal:", len(X))

y = (y.loc[X.notnull().any(axis=1),:])

X = (X.loc[X.notnull().any(axis=1),:])

print("After sample removal:", len(X))

#移除WAP001到WAP520特徵中全部為空值的特徵
all_nan = (X.isnull().all(axis=0) == False)
filtered_cols = (all_nan[all_nan].index.values)

print("Before removing predictors with no in-range values", X.shape)

X = X.loc[:,filtered_cols]

print("After removing predictors with no in-range values", X.shape)

'''
Skewness and Kurtosis
偏度和峰度指標是確定分佈與正態分佈有多接近的常用度量。 
當數據顯著偏離正態性統計量時，Box-Cox 變換是滿足正態性的一種方法。 
這對於標準統計測試是必要的，有時也是為了滿足標準線性回歸模型的線性和/或等方差假設
'''

#超出AP範圍RSSI值的偏度範圍
X_skew = X.skew()

sns.distplot(X_skew.dropna(),kde=False)

'''
我們可以觀察到大多數 WAP 列在區域 (0,1) 中具有低到中等的正偏度。 
在 (1,-1) 範圍之外仍有幾列通常被認為是可接受的偏度範圍。

接下來，在我們應用正態性測試之前，我們需要填寫當前為 NaN 的超出範圍的值。 
Box-Cox 變換要求所有值都是正數。 
為此，讓我們將預測變量從 dBm 尺度轉換為正常尺度。

此外，超出範圍的值將轉換為所有範圍內值中絕對最小值的 1/1/10。 
因此，轉換後的超出範圍值表示數據集中的最小 RSSI 值。
'''

X_exp = np.power(10,X/10,)

abs_min = (X_exp.apply(min).min())
print(abs_min)

X_exp.fillna(abs_min,inplace=True)

plt.plot(X_exp.iloc[:,0])

#Normality test

from scipy.stats.mstats import normaltest, skewtest, kurtosistest, skew, kurtosis

def normal_test(s):
    s = s.dropna()
    
    # Minimum samples required for Kurtosis = 21
    # Minimum samples required for Skewness = 8
    if len(s) <=20:
        return [np.nan, np.nan]
    k2, pvalue = normaltest(s)
    return list(normaltest(s))

def skew_test(s):
    s = s.dropna()
    
    # Minimum samples required for Skewness = 8
    if len(s) <=8:
        return np.nan
    z_score,pval = skewtest(s)
    return z_score

def kurtosis_test(s):
    s = s.dropna()
    
    # Minimum samples required for Kurtosis = 21
    if len(s) <=20:
        return np.nan
    z_score,pval = kurtosistest(s)
    return z_score

def skew_score(s):
    s = s.dropna()
    return float(skew(s).data)

def kurtosis_score(s):
    s = s.dropna()
    return kurtosis(s)

def in_range(s):
    return (s > abs_min).sum()

X_norm = pd.DataFrame({'Sample_Size': X_exp.apply(in_range),
                         #'Normality': X_train.apply(normal_test),
                         'Skewness': X_exp.apply(skew_score),
                         'Kurtosis': X_exp.apply(kurtosis_score),
                         #'Skew_Test': X_exp_train.apply(skew_test),
                         #'Kurtosis_Test': X_exp_train.apply(kurtosis_test)
                        })

'''
X_norm['k2'] = (X_norm['Normality']
                 .apply(lambda x: x[0]))

X_norm['p_value'] = (X_norm['Normality']
                 .apply(lambda x: x[1]))

X_norm.drop('Normality', axis = 1,inplace = True)
'''

X_norm.head(15)

(X_exp.iloc[:,0] > 0.0).sum()

sns.jointplot(y="Kurtosis", x="Skewness", data=X_norm)

'''
偏度：
對於正態分佈的數據，偏度應該在 0 左右。偏度值 > 0 意味著分佈的左尾有更多的權重。 
同樣，負值表示左偏分佈，右尾權重更大。

顯然，許多預測變量的偏度超出了 0,0 的預期範圍

峰度：
峰度是第四個中心矩除以方差的平方。 
如果分佈具有正峰度，則意味著它的尾部比正態分佈更多。 
類似地，如果分佈具有負峰度，則它的尾部比正態分佈少。

上圖中，對於偏度得分較高的列，峰度也比較極端。

可以通過繪製偏斜檢驗和峰度檢驗的 z 分數來檢查偏度和峰度分數的統計顯著性。
'''

'''
Box-Cox Transformation
'''

from scipy import stats
lmbdas, pppc = stats.boxcox_normplot(X_exp.iloc[:,100], -100, 100)

fig,ax = plt.subplots(1,1)
ax.plot(lmbdas,pppc,'bo')

_, maxlog = stats.boxcox(X_exp.iloc[:,0])
ax.axvline(maxlog, color='r')

ax.set_xlabel("$\lambda$")
ax.set_ylabel("Prob Plot Corr Coeff")
ax.text(x = -8, y = 0.1, s="$\lambda_{opt} = $" + str(maxlog))

def box_cox_lambda(s):
    _, maxlog = stats.boxcox(s)
    return maxlog

lambda_bc = X_exp.apply(box_cox_lambda)

X_boxcox = X_exp

for wap in X_boxcox:
    X_boxcox.loc[:,wap] = stats.boxcox(X_exp.loc[:,wap],lmbda = lambda_bc.loc[wap])

sns.distplot(lambda_bc, kde = False)
plt.title("Distribution of Box-Cox $\lambda$ across predictors")
plt.tight_layout()

# After Box-Cox
X_norm_post_boxcox = pd.DataFrame({'Skewness': X_boxcox.apply(skew_score),
                         'Kurtosis': X_boxcox.apply(kurtosis_score),
                         'BoxCox_Lambda': lambda_bc})

X_norm_post_boxcox.head(10)

fig, (ax1,ax2) = plt.subplots(1,2)

ax1.scatter(y="Kurtosis", x="Skewness", data=X_norm)
ax1.set_xlabel("Skewness")
ax1.set_ylabel("Kurtosis")
ax1.set_title("Pre- Box-Cox")

ax2.scatter(y="Kurtosis", x="Skewness", data=X_norm_post_boxcox)
ax2.set_xlabel("Skewness")
ax2.set_ylabel("Kurtosis")
ax2.set_title("Post- Box-Cox")

sns.jointplot(y="Kurtosis", x="Skewness", stat_func = None,data=X_norm_post_boxcox)

'''
StandardScaler (平均值和標準差)
'''

#特徵標準化
from sklearn.preprocessing import StandardScaler

sc = StandardScaler()
X_std = sc.fit_transform(X_exp)

X_std = pd.DataFrame(X_std)

#檢視標準化的資料筆數
X_std.shape

all_zero= ((X_std == 0) 
           .all()==False)

all_zero[all_zero].index.values

#After the Box-Cox transformation and scaling, few of the predictors are reduced to a constant value of 0
# Let's remove these predictors from the training and test data
all_zero= ((X_std == 0) 
           .all()==False)
filtered_cols = (all_zero[all_zero]
                 .index
                 .values)

print("Before removing predictors with only zeros", X_std.shape)

X_rm = X_std.loc[:,filtered_cols]

print("After removing predictors with only zeros", X_rm.shape)

#資料降維-PCA
from sklearn.decomposition import PCA

pca = PCA()
pca.fit(X_std)

# Borrowed from Sebastian Raschka's Python Machine Learning Book - Chapter 5

fig, ax = plt.subplots(1,1)

ax.bar(range(1, 255), pca.explained_variance_ratio_, alpha=0.5, align='center')
ax.step(range(1, 255), np.cumsum(pca.explained_variance_ratio_), where='mid')
ax.set_ylabel('Explained variance ratio')
ax.set_xlabel('Principal components')
ax.set_yticks(np.arange(0,1.1,0.1))

#轉成矩陣
X_std = np.array(X_std)

#將特徵465筆轉成300筆
Ndim_reduce = 300
X_pca = pca.transform(X_std)[:,:Ndim_reduce]

X_pca.shape

#匯出成csv檔案
import pickle
f = open("data_after_PCA.pckl", "wb")
pickle.dump(X_pca,f)
pickle.dump(y,f)

X_df = pd.DataFrame(X_pca)

X_train_df.shape

y_df = pd.DataFrame(y)

y.shape

#匯出成csv檔案
pd.DataFrame(X_train_df).to_csv("X_df.csv",na_rep = 'NaN')
pd.DataFrame(y_train_df).to_csv("y_df.csv",na_rep = 'NAN')

