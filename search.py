from tkinter import *
import tkinter as tk
import subprocess


win = tk.Tk()
win.title("Search Page")
win.geometry("650x400")
#win.configure(bg='grey')
win.resizable(width=False, height=False)


bg = PhotoImage(file="menus.png", master = win)
my = Canvas(win, width=400, height=350)
my.pack(fill="both", expand=True)
my.create_image(0,0, image=bg, anchor="nw")
my.create_text(320, 40, text="Search here!", font=("Helvetica",15,"bold"), fill="light green")


def backPage():
    win.destroy()
    import test

def update(data):
    
    list1.delete(0, END)
    
    for item in data:
        list1.insert(END, item)



def check(e):
    typed = my_entry.get()
    if typed =='':
        data = content
    else:
        data = []
        for item in content:
            if typed.lower() in item.lower():
                data.append(item)
    update(data)


def fillout(e):
    my_entry.delete(0, END)
    my_entry.insert(0, list1.get(ACTIVE))



#my_label = Label(win, text="Search/Filter here!", font=("Helvetica", 14), fg="Light green")
#my_label.pack(pady=20)
#my_label.place(x=220, y=30)

my_entry = Entry(win , font=("Helvetica", 10), width=60)
#my_entry.pack()
my_entry.place(x=100,y=70)

list1 = Listbox(win, font=("Helvetica", 8), width=100, height=22)
#list1.pack(padx=20,pady=20, fill=tk.BOTH,expand=True)
list1.place(x=20, y=120)
list1.configure(background="black", fg="light green")
#list1.place(x=20,y=20,width=400,height=300)


#f = open("test.txt", "r")
#for content in f:

  #  list1.insert(END,content)
 #   print(content)

#f.close()

with open('report.txt', 'r') as f:
    content=[]
    for line in f:
        strip_lines=line.strip()
        m=content.append(strip_lines)
        list1.insert(END,content)

update(content)


list1.bind("<<ListboxSelect>>", fillout)

my_entry.bind("<KeyRelease>", check) 

win.mainloop()

