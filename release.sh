# copy assets, libs, and production index for google drive for syncing. Run from Siorb directory

rm -rf release/*
cp -r assets release
cp prod_index.html release/index.html
mkdir release/libs
cp libComponents/Crafty-develop/crafty.js release/libs/
cp dist/siorb.js release/libs/siorb.js