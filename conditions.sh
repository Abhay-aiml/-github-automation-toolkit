#!/bin/bash
NAME="Abhay"
AGE=19

if [ "$NAME" = "Abhay" ]; then
    echo "Hello Abhay! Welcome!"
else
    echo "Who are you?"
fi

if [ $AGE -ge 18 ]; then
    echo "You are an adult!"
else
    echo "You are a minor!"
fi

if [ -f "variables.sh" ]; then
    echo "variables.sh EXISTS!"
else
    echo "File not found!"
fi
