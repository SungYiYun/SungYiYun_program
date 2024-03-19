import tkinter as tk
n,w,h=20,320,240
def xy(i):
    i = i%(n*4); #print(i)
    if i<n: return [i*w/n, 0]
    if i<n*2: return [w,(i-n)*h/n]
    if i<n*3: return [w-(i-n*2)*w/n, h]
    return [0,h-(i-n*3)*h/n]
    
cv=tk.Canvas(tk.Tk(),width=w,height=h)
#for i in range(n): cv.create_line(0,i*h/n,i*w/n,h)
for j in range(0,80,20):
    for i in range(j, j+n): cv.create_line(*xy(i), *xy(i+n))
cv.pack()
tk.mainloop()