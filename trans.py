from tkinter import *
from tkinter import ttk,messagebox
import googletrans
from googletrans import Translator
import textblob
from tkinter.font import Font
import subprocess as sub
import tkinter as tk
from PIL import Image, ImageTk
import time

win = Tk()
win.title("Translator")
win.geometry("700x480")
win.resizable(width=False, height=False)

font = Font(family = "Helvetica", size = 10)
win.option_add("*TCombobox*Listbox*Font", font)


PYTHONHTTPSVERIFY=0

bg = PhotoImage(file="transl.png", master = win)
my = Canvas(win, width=400, height=350)
my.pack(fill="both", expand=True)
my.create_image(0,0, image=bg, anchor="nw")
my.create_text(170, 360, text="--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", font=("Helvetica",10,"bold"), fill="white")
my.create_text(335, 380, text="[Choose a benchmark Section to translate below!]", font=("Helvetica",9,"bold"), fill="orange")

def auditResults():
    #p = sub.Popen(['sh','cis-trans1.sh'],stdout=sub.PIPE,stderr=sub.PIPE)
    #output, errors = p.communicate()
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans1'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def trans1():
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans1'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def trans12():
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans1.2'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def trans2():
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans2'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def trans3():
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans3'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def trans4():
    #p = sub.Popen(['sh','cis-trans1.sh'],stdout=sub.PIPE,stderr=sub.PIPE)
    #output, errors = p.communicate()
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans4'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def trans5():
    #p = sub.Popen(['sh','cis-trans1.sh'],stdout=sub.PIPE,stderr=sub.PIPE)
    #output, errors = p.communicate()
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans5'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def trans6():
    #p = sub.Popen(['sh','cis-trans1.sh'],stdout=sub.PIPE,stderr=sub.PIPE)
    #output, errors = p.communicate()
    p = sub.Popen(['bash', '-c', '. cis-trans.sh; trans6'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

#
def remediationR():
    p = sub.Popen(['sh','remediationGUI.sh'],stdout=sub.PIPE,stderr=sub.PIPE)
    output, errors = p.communicate()
    text1.delete(1.0,END)
    text1.insert(END, output)

def clear():
        # Clear the text boxes
    text1.delete(1.0, END)
    text2.delete(1.0, END)


def label_change():
    c=combo1.get()
    c1=combo2.get()
    label1.configure(text=c)
    label2.configure(text=c1)
    win.after(10,label_change)

def translate_now():
    text_=text1.get(1.0,END)
    t1=Translator()
    trans_text=t1.translate(text_,src=combo1.get(),dest=combo2.get())
    trans_text=trans_text.text

    text2.delete(1.0,END)
    text2.insert(END,trans_text)   




language=googletrans.LANGUAGES
languageV=list(language.values())
lang1=language.keys()

clear_button = Button(win, text="Clear", command=clear, font=("Helvetica",7,"bold"), height=5, width=12, activebackground="light blue",cursor="hand2", bg='black', fg='light blue', highlightbackground = 'light blue')
clear_button.place(x=310, y=270)

#b1 = Button( font=("Helvetica",7,"bold"), height=5, width=12, activebackground="green",cursor="hand2", bg='black', fg='green')

combo1=ttk.Combobox(win, values=languageV, font="Sans-serif 10", state="disabled")
#combo1=ttk.Combobox(win,values=languageV,font="Sans-serif 10",state="r")
combo1.place(x=60,y=20)
combo1.set("ENGLISH")

label1=Label(win,text="ENGLISH",font="segoe 10 bold",bg="white",width=18,bd=5, relief=GROOVE)
label1.place(x=60,y=50)

f=Frame(win,bg="Black",bd=5)
f.place(x=10,y=78,width=280,height=270)

text1=Text(f,font="Sans-serif 8",bg="black",relief=GROOVE,wrap=WORD, fg="light green")
text1.place(x=0,y=0,width=270,height=260)
#text1.insert(END, output)


#scrollbar1=Scrollbar(f)
#scrollbar1.pack(side="right",fill="y")

#scrollbar1.configure(command=text1.yview)
#text1.configure(yscrollcommand=scrollbar1.set)

#audit results button

#button=tk.Button(win, text="Audit",font=("Helvetica",7,"bold"), height=5, width=12, command=auditResults, activebackground="orange",cursor="hand2", bg='black', fg='orange', highlightbackground = 'orange')
#button.place(x=310, y=400)

#remediation results button

#button=tk.Button(win, text="Remediations",font=("Helvetica",7,"bold"), height=3, width=8, command=remediationR)
#button.place(x=240, y=150)

#2

combo2=ttk.Combobox(win,values=languageV,font="Sans-serif 10",state="r")
combo2.place(x=450,y=20)
combo2.set("ENGLISH")

label2=Label(win,text="ENGLISH",font="segoe 10 bold",bg="white",width=18,bd=5, relief=GROOVE)
label2.place(x=450,y=50)

#textbox frame

f1=Frame(win,bg="Black",bd=5)
f1.place(x=400,y=78,width=280,height=270)

text2=Text(f1,font="Sans-serif 8",bg="black",relief=GROOVE,wrap=WORD, fg="light green")
text2.place(x=0,y=0,width=270,height=260)

#scrollbar2=Scrollbar(f1)
#scrollbar2.pack(side="right",fill="y")

#scrollbar2.configure(command=text1.yview)
#text2.configure(yscrollcommand=scrollbar2.set)

label_change()

translate=Button(win,text="Translate", height=5, width=12, font=("Helvetica",7,"bold"),
 activebackground="green",cursor="hand2", bg='black', fg="light green", command=translate_now, highlightbackground = 'green' )

translate.place(x=310,y=200)

trans1B=Button(win,text="Section 1", height=5, width=12, font=("Helvetica",7,"bold"), activebackground="orange",cursor="hand2", bg='black', fg="white", command=trans1, highlightbackground = 'orange' )
trans1B.place(x=105,y=400)

trans12B=Button(win,text="Section 1.2", height=5, width=12, font=("Helvetica",7,"bold"), activebackground="orange",cursor="hand2", bg='black', fg="white", command=trans12, highlightbackground = 'orange' )
trans12B.place(x=175,y=400)

trans2B=Button(win,text="Section 2", height=5, width=12, font=("Helvetica",7,"bold"), activebackground="orange",cursor="hand2", bg='black', fg="white", command=trans2, highlightbackground = 'orange' )
trans2B.place(x=245,y=400)

trans3B=Button(win,text="Section 3", height=5, width=12, font=("Helvetica",7,"bold"), activebackground="orange",cursor="hand2", bg='black', fg="white", command=trans3, highlightbackground = 'orange' )
trans3B.place(x=315,y=400)

trans4B=Button(win,text="Section 4", height=5, width=12, font=("Helvetica",7,"bold"),  activebackground="orange",cursor="hand2", bg='black', fg="white", command=trans4, highlightbackground = 'orange' )
trans4B.place(x=385,y=400)

trans5B=Button(win,text="Section 5", height=5, width=12, font=("Helvetica",7,"bold"),  activebackground="orange",cursor="hand2", bg='black', fg="white", command=trans5, highlightbackground = 'orange' )
trans5B.place(x=455,y=400)

trans6B=Button(win,text="Section 6", height=5, width=12, font=("Helvetica",7,"bold"), activebackground="orange",cursor="hand2", bg='black', fg="white", command=trans6, highlightbackground = 'orange' )
trans6B.place(x=525,y=400)


#reme = Button(win, text="Remediation", height=5, width=12, font=("Helvetica",7,"bold"), activebackground="red",cursor="hand2", bg='black', fg="red", command=remediationR, highlightbackground = 'red')
#reme.place(x=440, y=400)

win.configure(bg="white")

enter_btn = PhotoImage(file='arrowp.png')
img_label = Label(image=enter_btn)
#arrow = tk.Button(win, image=enter_btn, font=("Helvetica",10,"bold"), borderwidth=0, highlightbackground = 'black')
#arrow.pack()
#arrow.place(x=300, y=180)



win.mainloop()

