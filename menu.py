#!/usr/bin/python

from tkinter import *
import numpy as np
import matplotlib.pyplot as plt
import tkinter as tk
import subprocess
import threading
import time
from PIL import Image,ImageTk
from tkinter import ttk

win = tk.Tk()
win.title("Home")
win.geometry("400x350")
win.resizable(width=False, height=False)
#win.configure(bg='black')

bg = PhotoImage(file="menup.png", master = win)
my = Canvas(win, width=400, height=350)
my.pack(fill="both", expand=True)
my.create_image(0,0, image=bg, anchor="nw")
my.create_text(200, 40, text="Menu Page", font=("Helvetica",15,"bold"), fill="white")

my.create_text(60, 130, text="Audit", font=("Helvetica",9,"bold"), fill="light blue")
my.create_text(240, 267, text="Translate", font=("Helvetica",9,"bold"), fill="orange")
my.create_text(150, 267, text="Filter", font=("Helvetica",9,"bold"), fill="orange")
my.create_text(60, 267, text="Search", font=("Helvetica",9,"bold"), fill="orange")
my.create_text(330, 267, text="Logfile", font=("Helvetica",9,"bold"), fill="orange")
my.create_text(20, 0, text="________________________________________________________________________________________________________________________________________________________________", 
font=("Helvetica",20,"bold"), fill="green")
my.create_text(200, 230, text="Advanced Audit Options", font=("Helvetica",9,"bold"), fill="orange")
my.create_text(150, 130, text="Summary", font=("Helvetica",9,"bold"), fill="light blue")
my.create_text(240, 130, text="Remediations", font=("Helvetica",7,"bold"), fill="light blue")
my.create_text(330, 130, text="Clear", font=("Helvetica",9,"bold"), fill="light blue")

my.create_text(200, 60, text="_________________________________________________________________________________________________________________________________________________________________________",
 font=("Helvetica",20,"bold"), fill="green")
my.create_text(200, 100, text="Basic Audit Options", font=("Helvetica",9,"bold"), fill="light blue")


def searchPage():
    #win.destroy()
    #import search
    import load

def filter():
    #win.destroy()
    #time.sleep(3)
    import filter
    
def trans():
    #win.destroy()
    #time.sleep(3)
    import trans

def prints():
    remediation= (subprocess.call(['sh','remediationG.sh'])) 
#subprocess.Popen(['sh','remediation.sh'])
def clear():
    subprocess.call(['bash', '-c', '. counter.sh; clears'])

def audit():
    #audit= (subprocess.call(['sh','script1.sh']))
    audit= (subprocess.call(['sh','cis-1.sh']))

def search():
    #subprocess.Popen(['bash', '-c', '. counter.sh; appendSearch']) 
    #time.sleep(9)
    searchPage()

def logfile():
    subprocess.Popen(['bash', '-c', '. counter.sh; logfile'])
    print("Successfully appended audit results into a logfile located at /var/log")
#label

label=tk.Label(win,font=("ubuntu",10,"bold"),fg="green",text="Test")
label.pack()


#remediations button
#button=tk.Button(win, text="Remediations",font=("Helvetica",7,"bold"), height=5, width=12, command=prints)
#button.pack(side = LEFT)
#button.place(x=210, y=150)

reme_btn = PhotoImage(file='remeb.png')
img_label = Label(image=reme_btn)
Reme_button=tk.Button(win, image=reme_btn, font=("Helvetica",7,"bold"),command=prints, borderwidth=0, bg='black')
Reme_button.pack()
Reme_button.place(x=210, y=140)

#audit button
audit_btn = PhotoImage(file='startb.png')
img_label = Label(image=audit_btn)
Audit_button=tk.Button(win, image=audit_btn, font=("Helvetica",7,"bold"),command=audit, borderwidth=0, bg='black')
Audit_button.pack()
Audit_button.place(x=30, y=140)

#search button

#Searchbutton=tk.Button(win, text="Search",font=("Helvetica",7,"bold"), height=5, width=12, command=search)
#Searchbutton.pack(side = LEFT)
#Searchbutton.place(x=300, y=140)

search_btn = PhotoImage(file='searchb.png')
img_label = Label(image=search_btn)
search_button=tk.Button(win, image=search_btn, font=("Helvetica",7,"bold"),command=search, borderwidth=0, bg='black')
search_button.pack()
search_button.place(x=210, y=275)
#search_button.place(x=300, y=140)
search_button.place(x=30, y=275)

#log file button

log_btn = PhotoImage(file='log.png')
img_label = Label(image=log_btn)
logbutton=tk.Button(win, image=log_btn, font=("Helvetica",7,"bold"), command=logfile, borderwidth=0, bg='black')
logbutton.pack(side = LEFT)
logbutton.place(x=300, y=275)

#clear button

clear_btn = PhotoImage(file='clear.png')
img_label = Label(image=log_btn)
clear=tk.Button(win, image=clear_btn,font=("Helvetica",7,"bold"), command=clear, borderwidth=0, bg='black')
clear.pack(side = LEFT)
#clear.place(x=210, y=280)
clear.place(x=300, y=140)

#filter button
filter_btn = PhotoImage(file='filter.png')
img_label = Label(image=filter_btn)
filterB=tk.Button(win, image=filter_btn, font=("Helvetica",7,"bold"),borderwidth=0, bg='black', command=filter)
filterB.pack(side = LEFT)
filterB.place(x=120, y=275)

#translate button
trans_btn = PhotoImage(file='transb.png')
img_label = Label(image=trans_btn)
trans=tk.Button(win,font=("Helvetica",7,"bold"), image=trans_btn, command=trans, borderwidth=0, bg='black')
trans.pack(side = LEFT)
#trans.place(x=30, y=275)
trans.place(x=210, y=275)

#graph button

#    commandP = 'bash -c "source counter.sh && pass"'
#    passCount = subprocess.getoutput(commandP)

   # commandF = 'bash -c "source counter.sh && fail"'
   # failCount = subprocess.getoutput(commandF)

   # commandE = 'bash -c "source counter.sh && ineli"'
   # ineliCount = subprocess.getoutput(commandE)

def func(pct, allvalues):
    absolute = int(pct / 100.*np.sum(allvalues))
    return "{:.1f}%\n({:d})".format(pct, absolute)

#def step():
 #   for x in range(25):
  #      loadlabel.config(text=loadbar['value'])
   #     loadbar['value'] += 4
    #    splash.update_idletasks()
     #   time.sleep(1)

def loading():
    splash = Tk()
    splash.title("")
    splash.geometry("200x130")
    splash.configure(bg='black')

    label1 = Label(splash, text="Loading... Please wait", font=("Helvetica", 10), fg="light green", bg="black")
    label1.place(x=40, y=20)

    loadlabel = Label(splash, text='', fg="light green", bg="black")
    loadlabel.place(x=120, y=20)

    #load2 = Label(splash, text='%', font=("Helvetica", 9), fg="light green", bg="black")
    #load2.place(x=150, y=20)

    loadbar = ttk.Progressbar(splash, orient=HORIZONTAL, length=100, mode='determinate')
    loadbar.place(x=50, y=80)
    
    #progress = ttk.Progressbar(splash, orient=HORIZONTAL, length=100, mode='indeterminate')
    #progress.place(x=50, y=80)
    #progress.start(10)
    
    for x in range(64):

        loadlabel.config(text=loadbar['value'])
        loadbar['value'] += 1.5
        splash.update_idletasks()
        time.sleep(1)

    splash.destroy()



def graph():

    commandP = 'bash -c "source pie.sh && pass"'
    passCount = subprocess.getoutput(commandP)

    commandF = 'bash -c "source pie.sh && fail"'
    failCount = subprocess.getoutput(commandF)

    commandE = 'bash -c "source pie.sh && ineli"'
    ineliCount = subprocess.getoutput(commandE)

    data = np.array([int(passCount), int(failCount), int(ineliCount)])
    label = ["PASS", "FAIL", "NOT Tested"]
    plt.pie(data, labels = label, autopct=lambda pct: func(pct, data))
    plt.legend()
    plt.show()
    
    #progress.stop()
  

#Piebutton = Button(win, text="Summary",font=("Helvetica",7,"bold"), height=5, width=12, command=graph)
#Piebutton.pack()
#Piebutton.place(x=120, y=150)

pie_btn = PhotoImage(file='pieb.png')
img_label = Label(image=pie_btn)
#chart_button=tk.Button(win, image=pie_btn, font=("Helvetica",7,"bold"),command=lambda:[threading.Thread(target=graph).start(), loading()], borderwidth=0, bg='black')

chart_button=tk.Button(win, image=pie_btn, font=("Helvetica",7,"bold"), command=graph, borderwidth=0, bg='black')
chart_button.pack()
chart_button.place(x=120, y=140)
#test
#audit_btn = PhotoImage(file='audit1.png')

#img_label = Label(image=audit_btn)
#img_label.pack(pady=20)


#command=lambda:[threading.Thread(target=graph).start(), loading]
win.mainloop()
