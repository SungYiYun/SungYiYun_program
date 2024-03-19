import tkinter as tk
n, w, h =20, 320, 240
cv = tk.Canvas(tk.Tk(), width = w, height = h)
for i in range(n): cv.create_line(0, i*h/n, i*w/n, h)
cv.pack()
tk.mainloop()