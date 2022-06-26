#for the GUI
from fileinput import filename
import tkinter as tk
#filedialog for the picking of apps, text displays text
from tkinter import filedialog, Text
#allows us to run apps
import os

#set up tk root and make an array for all the app paths
root = tk.Tk()
apps = []

#strip out empty spaces within save.txt file
if os.path.isfile('save.txt'):
    with open('save.txt', 'r') as f:
        tempApps = f.read()
        tempApps = tempApps.split(',')
        apps = [x for x in tempApps if x.strip()]

#function that allows user to open a file 
def addApp():
    #refresh the window each time that information is updated with a new file
    for widget in frame.winfo_children():
        widget.destroy()

    #open file explorer and allow user to select only .exe files
    filename = filedialog.askopenfilename(initialdir="/", title = "Open File",
                                          filetypes=(("executables", "*.exe"), ("all files", "*.*")))
    apps.append(filename)

    #add a label for each address that is added to the apps array
    for app in apps:
        label = tk.Label(frame, text=app, bg="gray")
        label.pack()

#when called, run all of the apps that are in the app array simultaneously
def runApps():
    for app in apps:
        os.startfile(app);

#create canvas
canvas = tk.Canvas(root, height=700, width=700, bg="#005178")
canvas.pack() #attaches the canvas to the root

#create frame inside the canvas
frame = tk.Frame(root, bg="white")
frame.place(relwidth=0.8, relheight=0.8, relx=0.1,rely=0.1)

#make a button that executes the addApp command when pressed
openFile = tk.Button(canvas, text="Open File", padx=10,
                    pady=5, fg="white", bg="#005178", command=addApp)
openFile.place(x=300,y=25)

#make a button that executes the runApps command when pressed
runApp = tk.Button(root, text="Run Apps", padx=10,
                    pady=5, fg="white", bg = "#005178", command=runApps)
runApp.pack()

#for loop to run through the array of the app locations and input a label onto the frame
for app in apps:
    label = tk.Label(frame, text=app)
    label.pack()

#Name the window
root.title("PhonoRater")

#Center the window
#root.state('zoomed')
#Run root
root.mainloop()

with open('save.txt', 'w') as f:
    for app in apps:
        f.write(app + ', ')