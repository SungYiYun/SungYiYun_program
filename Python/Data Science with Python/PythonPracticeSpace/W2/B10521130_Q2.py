str1 = input('請輸入第1個字串：')
str2 = input('請輸入第2個字串：')
str3 = input('請輸入第3個字串：')
qry  = input('請輸入查詢字串：')
strList = [str1,str2,str3]

print(qry,'存在', strList,'資料中：',qry in strList)