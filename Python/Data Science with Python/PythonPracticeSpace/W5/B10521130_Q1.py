#1. 建立一個程式，以"學號_Q1.py"進行命名。設計一計算長方形面積及周長的程式，首先設計一函式，能接受兩個參數，透過參數計算出長方形面積。
#再設計一函式，能接受兩個參數，透過參數計算出長方形周長。並提供使用者輸入長跟寬，輸出面積的結果。例如以下的執行結果：

#>python 學號_Q1.py
#請輸入長方形邊長：8
#請輸入長方形邊寬：6
#長方形面積： 48
#長方形周長： 28


def area(m,n):
    return m*n

def perimeter(m,n):
    return (m+n)*2

m = int(input('請輸入長方形邊長：'))
n = int(input('請輸入長方形邊寬：'))

a = area(m,n)
b = perimeter(m,n)

print('長方形面積：', a)
print('長方形周長：', b)