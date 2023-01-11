#!/bin/bash
# Title: addAlias.sh
# Code by, Lance Pierson
# Treyark Media
# Website: treyark.com | Twitter: @LanceTreyark
# GitHub: https://github.com/LanceTreyark



<<comment
This script is designed to do the following: 

Phase One
adds an alias file with 3 commands:
"hi"     This updates your system with a single command
"dude"   This initializes a new git repository with any file containing this script >> "microInit_i1.sh"
"commit" This prompts you for a commit message then commits the file you are in to GitHub.

Phase Two
creates a template/example repo in your ~/home directory that contains the scripts needed to 
run your "dude" & "commit" commands.
comment

#--------------------------PHASE ONE

# make .bash_aliases
cd ~/
cat >.bash_aliases <<EOF
alias hi="sudo apt update && sudo apt upgrade"
alias dude="./microInit_i1.sh"
alias commit="git add . && ./Q_Com.sh && git push -u origin main"
EOF

## Or, just add to the existing file if it exists: (#echo '' >> ~/.bash_aliases)
#echo 'alias hi="sudo apt update && sudo apt upgrade"' >> ~/.bash_aliases
#echo 'alias commit="git add . && ./Q_Com.sh && git push -u origin main"' >> ~/.bash_aliases
#echo 'alias dude="./microInit_i1.sh"' >> ~/.bash_aliases


mkdir /tmp/exampleRepo
curl -o /tmp/exampleRepo/Q_Com.sh https://raw.githubusercontent.com/LanceTreyark/Templates/main/newRepo_v2/Q_Com.sh
curl -o /tmp/exampleRepo/microInit_i1.sh https://raw.githubusercontent.com/LanceTreyark/Templates/main/newRepo_v2/microInit_i1.sh

cp -r /tmp/exampleRepo ~/


#--------------------------PHASE Two

# Make a copy of the exampleRepo w/custom name:
read -p "Choose a file name for your first auto repo:  " autoRepo1
cd ~/
cp -r exampleRepo ~/$autoRepo1


