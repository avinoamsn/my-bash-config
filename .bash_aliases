# EXECUTABLES
alias subl='"/c/Program Files/Sublime Text 3/sublime_text.exe"'
alias vsc='"/c/Users/Avi/AppData/Local/Programs/Microsoft VS Code/Code.exe"'
alias firefox='"/c/Program Files/Mozilla Firefox/firefox.exe"'
alias ex='explorer.exe'

# GIT
alias gs='git status'
alias gp='git push'
alias gps='git push & git push staging master && fg'
alias gpp='git push & git push production master && fg'
alias gpa='git push & git push staging master & git push production master && fg'

# Ampsight
#alias cloud-docker='cd ~/ampsight/cloud-assessment-tool/; docker-compose up api postgres'
alias cloud-start='cd ~/ampsight/cv2/frontend; npm start'
alias cloud='cd ~/ampsight/cv2/frontend'

# Python Django
alias migrate='python manage.py migrate'
alias runserver='python manage.py runserver'
alias createsuperuser='python manage.py createsuperuser'
