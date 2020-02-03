#!/bin/bash

value="$(xset q | grep 'Scroll' | awk '{ print $NF }')"
# echo $value;

if [ $value == 'on' ]
then
echo "Turning Off LED"
xset led off
else
echo "Turning On LED"
xset led on
fi
