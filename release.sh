# copy assets, libs, and production index for google drive for syncing. Run from Siorb directory

rm -rf release/*
cp prod_index.html release/index.html
mkdir release/libs
cp libComponents/Crafty-develop/crafty.js release/libs/
cp dist/siorb.js release/libs/siorb.js

# rm -rf /Users/pablo/Dropbox/Aplicaciones/KISSr/siorb.kissr.com/*
cp -r release/* /Users/pablo/Dropbox/Aplicaciones/KISSr/siorb.kissr.com/