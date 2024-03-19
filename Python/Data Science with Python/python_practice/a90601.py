import tkinter as tk
from random import randint as rI,random as rF
w,h = 320,240
#x,y = w//2,h//2
#dX,dY = rI(1,2)*(a if rF()<.5 else -1),rI(1,10)*(1 if rF()<.5 else -1);
def sw():
    for a in ln:
        l,x,y,dX,dY = a
        x+=dX;
        y+=dY;
        if x>w or x<0: dX*=-1; x+=dX*2
        if y>h or y<0: dY*=-1; y+=dY*2
        a[1:] = [x,y,dX,dY];cv.coords(l,w//2,h//2,x,y);
    cv.after(100,sw)  
cv = tk.Canvas(tk.Tk(),width=w,height=h)
ln = [[cv.create_line(0,0,0,0),w//2,h//2,rI(1,10)*(1 if rF()<.5 else -1),rI(1,10)*(1 if rF()<.5 else -1)] for i in range(20)]
sw()
cv.pack()
tk.mainloop()