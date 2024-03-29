# EXECUTABLES
alias subl='"/c/Program Files/Sublime Text 3/sublime_text.exe"'
alias firefox='"/c/Program Files/Mozilla Firefox/firefox.exe"'
alias ex='explorer.exe'
alias c='code $(pwd -P)' # avoids vscode bug where git diff gutters don't work in symlink'd dirs

###########################
# GIT & RELATED ALIASES
###########################

# GIT
alias gbrda='git branch --no-color --remote --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d -r' # ohmyzsh's 'gbda' but for the remote branchs
alias grp='grup origin --prune'                                                                                                                       # ? prune local list of remote branches, not sure if this is any different from ohmyzsh's gfa (git fetch --all --prune)

# GH PAGES
#alias portfolio='git subtree push --prefix public origin gh-pages'
alias portfolio='git push origin `git subtree split --prefix public master`:gh-pages --force' # https://stackoverflow.com/questions/33172857/how-do-i-force-a-subtree-push-to-overwrite-remote-changes

# WPENGINE-SPECIFIC GIT
alias gs='git status'
alias gp='git push'
alias gps='git push & git push staging master && fg'
alias gpp='git push & git push production master && fg'
alias gpa='git push & git push staging master & git push production master && fg'

###########################
# PYTHON & RELATED ALIASES
###########################

# PIPENV
alias activate='source env/bin/activate'

# DJANGO
alias py='python manage.py' # prepend to manage cmds (see examples below)
alias collectstatic='py collectstatic'
# serve
alias runserver='py runserver'
alias start='activate; runserver'
# migrations
alias makemigrations='py makemigrations'
alias migrate='py migrate'
# data mgmt
alias flush='py flush'
alias loaddata='py loaddata' # append fixture path to the cmd
alias dumpdata='py dumpdata'
alias syncdb='py syncdb'
# admin
alias createsuperuser='py createsuperuser'

###########################
# PROJECT-SPECIFIC ALIASES
###########################

# HITCH
alias hitch-host='firebase deploy --only hosting:hitch-4caa0'

# AMPSIGHT
alias cv-loaddata='loaddata cv/fixtures/cv_full.json cv/fixtures/rss_article.json;' # load default CV fixtures

# ? the below command initializes a CV instance w/ a postgres db inside of a docker container
# ! assumes that the last (top) stash contains updated `Makefile` & `scripts/create_role.sql` files
alias cv-launch='cd ~/ampsight/cv/cv2; gstaa stash@{0}; activate; make install_database; grhh; migrate; cv-loaddata; start'
