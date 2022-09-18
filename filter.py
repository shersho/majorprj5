from tkinter import *
import tkinter as tk
import subprocess
import subprocess as sub
from tkinter import ttk
import time
import threading

root = tk.Tk()
root.title("Filter Page")
root.geometry("650x400")
root.resizable(width=False, height=False)


fbg = PhotoImage(file="menusfp.png", master = root)
fil = Canvas(root, width=400, height=350)
fil.pack(fill="both", expand=True)
fil.create_image(0,0, image=fbg, anchor="nw")

progress = ttk.Progressbar(root, orient=HORIZONTAL, length=300, mode='indeterminate')
progress.place(x=40, y=300)


def back():
    root.destroy()

def clear():
    text1.configure(state='normal')
    text1.delete(1.0,END)
    text1.configure(state='disabled')
def pstart():
    progress.start(10)

#def pstop():
    #progress.stop

def passResults():
    #progress.start(10)
    #time.sleep(3)
    p = sub.Popen(['bash', '-c', '. counter.sh; filterP'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.configure(state='normal')
    text1.delete(1.0,END)
    text1.insert(END, output)
    text1.configure(state='disabled')
    progress.stop()

def failResults():
    p = sub.Popen(['bash', '-c', '. counter.sh; filterF'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.configure(state='normal')
    text1.delete(1.0,END)
    text1.insert(END, output)
    text1.configure(state='disabled')
    progress.stop()
def noResults():
    p = sub.Popen(['bash', '-c', '. counter.sh; filterN'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.configure(state='normal')
    text1.delete(1.0,END)
    text1.insert(END, output)
    text1.configure(state='disabled')
    progress.stop()
def allAudit():
    p = sub.Popen(['bash', '-c', '. counter.sh; filterA'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.configure(state='normal')
    text1.delete(1.0,END)
    text1.insert(END, output)
    text1.configure(state='disabled')
    progress.stop()


#def logfile():
 #   subprocess.Popen(['bash', '-c', '. counter.sh; logfile'])

b1 = Button(root, text='PASS', font=("Helvetica",7,"bold"), height=5, width=12,command=lambda:[pstart(), threading.Thread(target=passResults).start()], activebackground="green",cursor="hand2", bg='black', fg='green')
b1.place(x=215, y=20)

b2 = Button(root, text='FAIL', font=("Helvetica",7,"bold"), height=5, width=12,command=lambda:[pstart(), threading.Thread(target=failResults).start()], activebackground="red",cursor='hand2', bg='black', fg='red')
#b2.pack()
b2.place(x=285, y=20)

b3 = Button(root, text='Not Tested', font=("Helvetica",7,"bold"), height=5, width=12, activebackground="orange",cursor='hand2',command=lambda:[pstart(), threading.Thread(target=noResults).start()], bg='black', fg='orange')
b3.place(x=355, y=20)

b4 = Button(root, text='All', font=("Helvetica",7,"bold"), height=5, width=12, activebackground="pink",cursor='hand2',command=lambda:[pstart(), threading.Thread(target=allAudit).start()], bg='black', fg='pink')
b4.place(x=145, y=20)

b5 = Button(root, text='Clear', font=("Helvetica",7,"bold"), height=5, width=12, activebackground="yellow",cursor='hand2',command=clear, bg='black', fg='yellow')
b5.place(x=425, y=20)

b6 = Button(root, text='Back', font=("Helvetica",7,"bold"), height=5, width=12, activebackground="blue",cursor='hand2', command=back, bg='black', fg='light blue')
b6.place(x=40, y=20)
#my_label = Label(root, text="Search/Filter here!", font=("Helvetica", 14), fg="Grey")
#my_label.pack(pady=20)

#my_entry.place(x=200,y=30)

#list1 = Entry(root, font=("Helvetica", 8))
#list1.pack(padx=20,pady=20, fill=tk.BOTH,expand=True)
#list1.configure(background="skyblue4")
text1=Text(root, font="Sans-serif 8",bg="black",relief=GROOVE,wrap=WORD,fg='white')
text1.place(x=40,y=90,width=580,height=270)
text1.configure(state='disabled')

def step():
    #progress['value'] += 20
    progress.start(10)

progress = ttk.Progressbar(root, orient=HORIZONTAL, length=300, mode='indeterminate')
progress.place(x=160, y=370)

pbutton = Button(root, text='Progress', command=step)
pbutton.place(x=30, y=20)
root.mainloop()
