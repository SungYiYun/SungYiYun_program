1. 建立一個程式，以"學號_Q1.py"進行命名。設計一帳號密碼比對的程式，接受帳號與密碼的輸入。
判斷帳號密碼是否正確，若中途有輸入中斷(ctrl + c)，則會顯示"發生錯誤"。例如以下的執行結果：

>python 學號_Q1.py
請輸入帳號：test
請輸入密碼：1234
帳號密碼正確

>python 學號_Q1.py
請輸入帳號：test
請輸入密碼：1111
帳號密碼錯誤

>python 學號_Q1.py
請輸入帳號：(ctrl + c)
發生錯誤

try:
    user = input('請輸入帳號：')
    password = int(input('請輸入密碼：')
    
