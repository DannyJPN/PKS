
#!/bin/bash

echo "D1 activated at $(date)" >> timelog.log
mkdir Pinec -p
cd Pinec
wget -vr ostravskypinec.cz 
wget -vr ittf.com 

