# first create a docstring for multiline commment
if [ $# == 0 ] 
then 
    echo "Name of .py script needed!!!"
else
    extension=".py"
    filename="${1}$extension"
    touch $filename
    echo "Successfully created $filname"

    # write to the file
    cat ~/my_shell_scripts/info.txt > $filename
    # we can create flags -cc for code chef  and add more functionalitis like taking input

    # run the python script that takes extracts the names of the question... for now ... more for later
    python codechef_extractor.py
fi

