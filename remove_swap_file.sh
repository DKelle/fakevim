#! bin/bash

# eg. temp.py
FILE=$1

#eg .temp.py.swp
SWP_FILE=".$FILE.swp"

# There's a swp file for this. Should we close it?
if [ -f $SWP_FILE ] ; then
    echo "swp file exists. Kill? (y/n)"
    read INPUT
    while [ "$INPUT" != "y" ] && [ "$INPUT" != "n" ]
    do
        echo "(y/n) "
        read INPUT
    done

    #Kill or no?
    if [ "$INPUT" == "y" ] ; then
        $(rm $SWP_FILE)
        vim $FILE
    fi
fi

# No swap file exists. Just open the file
vim $FILE
