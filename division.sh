is_integer(){
    if [[ $1 =~ ^[0-9]+$ ]];
        then
            return 0
    else
        return 1
    fi
}
if [[ $# -ne 2 ]]
    then 
        echo "Error: two numbers must be provided";
else

    if ! is_integer "$1" || ! is_integer "$2";
        then
            echo "Error: both arguments must be integers";
    else
        if [[ $2 -eq 0 ]];
            then
                echo "Error: division by zero is not allowed"
        else
           echo "$1 / $2" | bc
        fi
    fi
fi