#!/bin/bash


git pull
git add --all .
echo "Please, enter commit:"
read B

git commit -m "TIKET-ID: $B"
git push