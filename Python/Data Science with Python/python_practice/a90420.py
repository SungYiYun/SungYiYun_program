def _(n, s1, x1, s2=0, x2=0): return [' '*s1+'X'*x1+' '*s2+'X'*x2]*n

#print(_(4,0,1,5,1));print(_(1,0,7));print(_(4,0,1,5,1));
#for s in _(4,0,1,5,1)+_(1,0,7)+_(4,0,1,5,1):print(s)
#for s in _(4,0,0)+_(1,0,7)+_(3,0,1,5,1)+_(1,0,7):print(s)

H=_(4,0,1,5,1)+_(1,0,7)+_(4,0,1,5,1)
O=_(4,7,0)+_(1,0,7)+_(3,0,1,5,1)+_(1,0,7)
P=_(1,0,7)+_(3,0,1,5,1)+_(1,0,7)+_(4,0,1,6)
#for a,b in zip(H,O): print(a+'  '+b)

for y in range(9):
    print(H[y]+'  '+O[y]+'  '+P[y]+'  '+H[y])
