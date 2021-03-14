#!/bin/bash
# Enter src location of blog file
location="/home/user/src/"

no_tail(){
    read -e -p "What will you blog about: " var1
    echo "$(date) $var1" >> $location
}

if [[ $# == 0 ]]; then
    no_tail
    echo
    tail $location
    echo
else
    while [[ ! $# == 0 ]]
    do 
        case "$1" in
            -l)
                cat $location
                ;;
            -s)
                no_tail
                ;;
            *)
                echo "Enter correct flags"
                ;;
        esac
        shift
    done
fi

exit 0
