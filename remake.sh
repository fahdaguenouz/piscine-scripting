#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Error"
    exit 1
fi

DIR="$1"

if [[ ! -d "$DIR" ]]; then
    echo "Error"
    exit 1
fi

touch "$DIR/ciao"
mkdir "$DIR/mamma"
touch "$DIR/guarda"
touch "$DIR/come"
mkdir "$DIR/mi"
touch "$DIR/diverto"

chmod 442 "$DIR/ciao"
chmod 777 "$DIR/mamma"    
chmod 400 "$DIR/guarda"    
chmod 642 "$DIR/come"      
chmod 452 "$DIR/mi"        
chmod 421 "$DIR/diverto"   

touch -t 01010001 "$DIR/ciao"
touch -t 01020001 "$DIR/mamma"
touch -t 01030001 "$DIR/guarda"
touch -t 01040001 "$DIR/come"
touch -t 01050001 "$DIR/mi"
touch -t 01060001 "$DIR/diverto"

exit 0
