#!/bin/bash

#should execute only if there is an argument else exit. 

#create main project folder
mkdir $1/{.sass-cache,SASS{BASE,LAYOUT,MODULE,STATE,THEME},CSS}
cd $1/SASS
touch BASE/_base-dir.sass LAYOUT/_layout-dir.sass MODULE/_module-dir.sass STATE/_state-dir.sass THEME/_theme-dir.sass app.sass # done for creating partials
cd ..
touch $1/CSS/app.css
touch $1/index.html
#showing the structure created. 
tree .

# we can add -w flag for --watch 
# we can also add -x flag for removing an existing system of SMACSS structure
