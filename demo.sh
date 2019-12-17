#!/bin/bash

find cows/ -type f -iname *.cow | xargs -n 1 -P 1 -I {} cowsay -f {} 'demo'
