#!/bin/bash

function string_replace {
    echo "${1//$2/$3}"
}

PRJ=$1
PKG=$2
PWD=$3

PKG_PATH=$(string_replace "$PKG" "\." "/")

cd $PWD

tar xvf ~/tools/piasy_android_simple_lib.tar

mv GitHubAndroidOAuth $PRJ

cd $PRJ

mv GitHubAndroidOAuth $PRJ

echo "include ':$PRJ'" > settings.gradle

echo "##$PRJ" > README.md

mkdir -p $PRJ/src/main/java/$PKG_PATH

mkdir -p $PRJ/src/debug/java/$PKG_PATH

mv $PRJ/src/main/java/com/github/piasy/oauth3/github/GitHubOAuth.java $PRJ/src/main/java/$PKG_PATH/GitHubOAuth.java

mv $PRJ/src/debug/java/com/github/piasy/oauth3/github/MainActivity.java $PRJ/src/debug/java/$PKG_PATH/MainActivity.java

mv $PRJ/src/debug/java/com/github/piasy/oauth3/github/MyApp.java $PRJ/src/debug/java/$PKG_PATH/MyApp.java

rmdir -p $PRJ/src/main/java/com/github/piasy/oauth3/github/ $PRJ/src/debug/java/com/github/piasy/oauth3/github/
