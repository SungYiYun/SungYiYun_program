#a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
#a = [['xx  xx', 'x x x', ' x x x'], ['xxx   ', '   xxx', 'x xx x'], ['x    x', 'xx   xx', 'xxxx   ']]
#for x, y, z in zip(*a):print(x)
#print([' '.join(x) for x in zip(*a)])
def _(h,s1,x1=0,s2=0,x2=0): return [' '*s1+'x'*x1+' '*s2+'x'*x2]*h
#a = [_(3,0,1,5,1)+_(1,0,7)+_(3,0,1,5,1),_(3,0,1,5,1)+_(1,0,7)+_(3,0,1,5,1),_(3,0,1,5,1)+_(1,0,7)+_(3,0,1,5,1)]
H = _(3,0,1,5,1)+_(1,0,7)+_(3,0,1,5,1)+_(1,7)
o = _(2,7)+_(1,0,7)+_(2,0,1,5,1)+_(1,0,7)+_(2,7)
p = _(2,7)+_(1,0,7)+_(2,0,1,5,1)+_(1,0,7)+_(2,0,1,6)
q = _(2,7)+_(1,0,7)+_(2,0,1,5,1)+_(1,0,7)+_(2,6,1)

a = [H,o,p,q,H]



print('\n'.join('  '.join(x) for x in zip(*a)))