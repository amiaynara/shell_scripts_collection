#!/bin/bash

#should execute only if there is an argument else exit. 

if [ $# ==  0 ]
then
  echo "Name of the project NEEDED!!!"
else  
#create main project folder
  mkdir $1
  mkdir -p $1/{.sass-cache,SASS/{BASE,LAYOUT,MODULE,STATE,THEME},CSS}
  cd $1/SASS
  touch BASE/_base-dir.sass LAYOUT/_layout-dir.sass MODULE/_module-dir.sass STATE/_state-dir.sass THEME/_theme-dir.sass app.sass # done for creating partials
  cd ..
  touch CSS/app.css
  touch index.html                # the main index file here
  touch _variables.sass           # all the variables go here[$example_var]
  touch _mixins.sass              # only mixins go here

#showing the structure created. 
  tree .

  echo "STRUCTURE successfully created!!!"
fi

# we can add -w flag for --watch 
# we can also add -x flag for removing an existing system of SMACSS structure
