
from tkinter import *
from tkinter import ttk
import time



splash = Tk()
splash.title("")
splash.geometry("200x130")
splash.configure(bg='black')

label1 = Label(splash, text="Loading...", font=("Helvetica", 10), fg="light green", bg="black")
label1.place(x=50, y=20)

loadlabel = Label(splash, text='', font=("Helvetica", 9), fg="light green", bg="black")
loadlabel.place(x=120, y=20)

load2 = Label(splash, text='%', font=("Helvetica", 9), fg="light green", bg="black")
load2.place(x=155, y=20)

loadbar = ttk.Progressbar(splash, orient=HORIZONTAL, length=120, mode='determinate')
loadbar.place(x=50, y=80)

def step():
    for x in range(6):
        loadlabel.config(text=loadbar['value'])
        loadbar['value'] += 15
        splash.update_idletasks()
        time.sleep(1)
    



def remove():
    loadbar.stop()
    splash.destroy()
    import search


splash.after(10000, remove)


step()

mainloop()
