#!/bin/bash

#should execute only if there is an argument else exit. 

if [ $# ==  0 ]
then
  echo "Name of the project NEEDED!!!"
else  
#create main project folder
  mkdir $1
  mkdir -p $1/{.sass-cache,SASS/{BASE,LAYOUTS,MODULES,STATE,THEME},CSS,assets}
  cd $1/SASS
  touch BASE/_base-dir.sass LAYOUTS/_layout-dir.sass MODULES/_module-dir.sass STATE/_state-dir.sass THEME/_theme-dir.sass app.sass # done for creating partials
  
  echo "@import \"variables-dir\"" >> app.sass
  echo "@import \"mixins-dir\"" >> app.sass
  echo "@import \"BASE/base-dir\"" >> app.sass
  echo "@import \"LAYOUTS/layout-dir\"" >> app.sass
  echo "@import \"MODULES/module-dir\"" >> app.sass
  echo "@import \"STATE/state-dir\"" >> app.sass
  echo "@import \"THEME/theme-dir\"" >> app.sass
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
