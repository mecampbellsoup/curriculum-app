#!/bin/sh

curl -u "mecampbellsoup:$1" https://api.github.com/user/repos -d "{\"name\":\"$2\"}";
cp -r $3 $3/../$2;
cd ../$2;
git init;
git add --all;
git commit -m "New lab for you nerds!";
git remote add origin $4;
git push origin master;