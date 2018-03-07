#!bin/bash

cd $1 && du -sk * | sort -rn
