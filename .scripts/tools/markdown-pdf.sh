#!/bin/bash
name=$(basename $1)
rm $1.pdf &
markdown-pdf $1 >> $name.pdf
