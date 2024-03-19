from keras.models import Sequential
from keras.layers import Dense,Reshape
from keras.layers import Conv1D, GlobalAveragePooling1D, MaxPooling1D
import os
import seaborn as sns;
from sklearn.metrics import confusion_matrix
import keras as K
import tensorflow as tf
import pandas as pd
import numpy as np
from keras.layers.normalization import BatchNormalization
from sklearn import preprocessing
from sklearn.model_selection import train_test_split
from keras.layers import Dropout
import matplotlib.pyplot as plt
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

print("\ndataset using Keras/TensorFlow ")
np.random.seed(4)
tf.set_random_seed(13)

seq_length = 64
learning_rate=0.001
fch_nodes=512
momentum=0.9
# keras.layers.BatchNormalization(epsilon=1e-06,mode=0,momentum=0.9,weights=None)

# define the function
def training_vis(hist):
    loss = hist.history['loss']
    val_loss = hist.history['val_loss']
    acc = hist.history['acc']
    val_acc = hist.history['val_acc']

    # make a figure
    fig = plt.figure(figsize=(8,4))
    # subplot loss
    ax1 = fig.add_subplot(121)
    ax1.plot(loss,label='train_loss')
    ax1.plot(val_loss,label='val_loss')
    ax1.set_xlabel('Epochs')
    ax1.set_ylabel('Loss')
    ax1.set_title('Loss on Training and Validation Data')
    ax1.legend()
    # subplot acc
    ax2 = fig.add_subplot(122)
    ax2.plot(acc,label='train_acc')
    ax2.plot(val_acc,label='val_acc')
    ax2.set_xlabel('Epochs')
    ax2.set_ylabel('Accuracy')
    ax2.set_title('Accuracy  on Training and Validation Data')
    ax2.legend()
    plt.tight_layout()

# 1. 读取数据集
print("Loading data into memory")
totaltrain_data1 = pd.read_excel(r'C:\pycharm_data\totaldata.xls')
target_data = pd.read_excel(r'C:\pycharm_data\targetdata.xls')
target_data2 = pd.get_dummies(target_data['鞋碼'])
totaltrain_data2 = totaltrain_data1.values
# one-hot編碼
target_onehot = target_data2.values

# 標準化
totaltrain_data3=preprocessing.scale(totaltrain_data2, axis=0, with_mean=True, with_std=True, copy=True)

# 正規化
Min_Max_Scaler = preprocessing.MinMaxScaler(feature_range=(0, 1))  # 設定縮放的區間上下限
totaltrain_data4 = Min_Max_Scaler.fit_transform(totaltrain_data3)

# 分割數據
X_train, X_test, y_train, y_test = train_test_split(totaltrain_data4, target_onehot, train_size=0.8, test_size=0.2)




X_train=X_train[:,:,np.newaxis]
X_test=X_test[:,:,np.newaxis]
# 模型
model = Sequential()
model.add(Conv1D(160, 2,activation='relu',kernel_initializer='he_normal',input_shape=( 6,1  ) ))
model.add(BatchNormalization(epsilon=1e-06,mode=0,momentum=0.9,weights=None))
model.add(Dropout(0.1))
model.add(Conv1D(80, 2,activation='relu',kernel_initializer='he_normal',))
model.add(BatchNormalization(epsilon=1e-06,mode=0,momentum=0.9,weights=None))
model.add(Dropout(0.1))
model.add(Conv1D(60, 2,activation='relu',kernel_initializer='he_normal',))
model.add(BatchNormalization(epsilon=1e-06,mode=0,momentum=0.9,weights=None))
model.add(MaxPooling1D(2))
model.add(Dropout(0.1))
model.add(Conv1D(30, 1,activation='relu',kernel_initializer='he_normal',))
model.add(BatchNormalization(epsilon=1e-06,mode=0,momentum=0.9,weights=None))
model.add(Dropout(0.1))
model.add(Conv1D(15, 1,activation='relu',kernel_initializer='he_normal',))
model.add(BatchNormalization(epsilon=1e-06,mode=0,momentum=0.9,weights=None))
model.add(Dropout(0.1))
model.add(Conv1D(8, 1,activation='relu',kernel_initializer='he_normal',))
model.add(BatchNormalization(epsilon=1e-06,mode=0,momentum=0.9,weights=None))
model.add(GlobalAveragePooling1D())
model.add(Dropout(0.1))
model.add(Dense(6, activation='softmax'))
print(model.summary())
model.compile(loss='categorical_crossentropy',
              optimizer='adam',
              metrics=['accuracy'])
b_size =25
max_epochs =1500
history=model.fit(X_train, y_train, batch_size=b_size, epochs=max_epochs, shuffle=True, verbose=1 ,validation_split=0.25)
# 4. 评估模型
eval = model.evaluate(X_test, y_test, verbose=0)
print("Evaluation on test data: loss = %0.6f accuracy = %0.2f%% \n" \
        % (eval[0], eval[1] * 100))
training_vis(history)

# 第二次run
# 混淆矩陣
# 儲存預測的鞋碼資料NOT ONE_HOT
pre=model.predict_classes(X_train)
# onehot轉回去分類
true = np.argmax(y_train, axis=1)
sns.set()
y_true = true
y_pred = pre
C2= confusion_matrix(y_true, y_pred)
sns.heatmap(C2,annot=True,cmap="BuPu",fmt="d")
plt.show()