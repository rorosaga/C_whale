# In terminal: 
- cd into cw
- On mac: 
    + In makefile, change line 23 to cp ./cw.out /usr/local/bin/cw
    + Run "sudo make install" from terminal
- On windows: 
    + In makefile, change line 23 to cp ./cw.out C:\ProgramData\chocolatey\bin\cw
    + Open git bash as administrator and cd into cw, 
    + You need to have chocolatey installed -> https://chocolatey.org/install
    + Run "make install"

- Then, you should run from terminal "cw" or "./cw.out" and get "Hello World" message to make sure it works