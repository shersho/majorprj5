
#!/usr/bin/python

from tkinter import *
import tkinter as tk
import subprocess

win = tk.Tk()

win.title("Start")
win.geometry("350x350")
win.configure(bg='black')

def nextPage():
    win.destroy()
    import menu


bg = PhotoImage(file="page1.png")
my = Canvas(win, width=400, height=350)
my.pack(fill="both", expand=True)
my.create_image(0,0, image=bg, anchor="nw")
my.create_text(170, 50, text="BASHVENGERS", font=("Helvetica",15,"bold"), fill="light green")
my.create_text(170, 310, text="Automated Linux Audit Tool", font=("Helvetica",15,"bold"), fill="light green")


#canvas = Canvas(win, width=400,height=350)
#canvas.pack(fill=BOTH, expand=True)
#img = PhotoImage(file="4.png")
#i = canvas.create_image(0,0,image=img)

#label=tk.Label(win,font=("Helvetica",14,"bold"),fg="black",text="Linux Audit Tool")
#label.pack()
#label.place(x=100, y=50)

#enter_btn = PhotoImage(file='enterp.png')
#img_label = Label(image=enter_btn)
#button1 = tk.Button(win, image=enter_btn, font=("Helvetica",10,"bold"), command=nextPage, borderwidth=0)
#button1.pack()
#button1.place(x=130, y=280)

#canvas
#my_canvas = Canvas(win, width=350, height=350)
#my_canvas.pack(fill="both", expand=True)
#my_canvas.create_image(0,0, anchor="nw")

#button_window = my_canvas.create_window(150, 170, anchor="nw", window=button1)
def remove():
    win.destroy()
    import menu


win.after(4000, remove)


win.mainloop()


