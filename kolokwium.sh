#!/bin/bash

mkdir $1
cd $1

git init
git remote add origin "git@github.com:PiotrKinowski/powkolo.git"

cp ../kolokwium_config.sh .
cp ../kolokwium.sh .

echo 32704 > ReadMe.MD

git add *

git commit -m "First commit"

git checkout -b Test

head -n 10 kolokwium.sh > Add.txt
tail -n 10 kolokwium.sh > Skip.txt

echo "Skip.txt" > .gitignore

git add *

git commit -m "Test commit"

git push origin Test

git checkout master

git push origin master

git checkout Test

git reset --soft HEAD^2

git commit -m "Clean Up"

git push origin Test
