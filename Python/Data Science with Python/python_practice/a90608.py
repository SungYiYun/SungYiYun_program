import tkinter as tk,math
w,h = 320,240
cv=tk.Canvas(tk.Tk(),width=w,height=h);
w//=2
h//=2
x,y=0,0
for i in range(100):
    X,Y=i*math.cos(i/10),i*math.sin(i/10)
    cv.create_line(w+x,h+y,w+X,h+Y)
    x,y=X,Y
cv.pack()
tk.mainloop()