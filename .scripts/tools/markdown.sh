#!/bin/bash

name=$(basename $1)
rm $name.html &
markdown $1 >> $name.html
