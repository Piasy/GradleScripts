#!/bin/bash

# credit: https://github.com/dropbox/djinni/blob/master/example/run_djinni.sh
# Locate the script file.  Cross symlinks if necessary.
loc="$0"
while [ -h "$loc" ]; do
    ls=`ls -ld "$loc"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        loc="$link"  # Absolute link
    else
        loc="`dirname "$loc"`/$link"  # Relative link
    fi
done
base_dir=$(cd "`dirname "$loc"`" && pwd)

PRJ_NAME=$1
PWD=$2

PRJ_PKG_NAME=`echo "$PRJ_NAME" | perl -pe 's/([a-z0-9])([A-Z])/$1_\L$2/g' | perl -ne 'print lc'`
PKG="com.github.piasy.$PRJ_PKG_NAME"
PKG_PATH=`echo "$PKG" | sed -e 's/\./\//g'`

cd $PWD

tar xvf $base_dir/piasy_android_simple_lib.tar

mv PRJ_NAME $PRJ_NAME

cd $PRJ_NAME

mv PRJ_NAME $PRJ_NAME

echo "# $PRJ_NAME" > README.md

mkdir -p $PRJ_NAME/src/main/java/$PKG_PATH/
mkdir -p $PRJ_NAME/src/debug/java/$PKG_PATH/

mv $PRJ_NAME/src/main/java/com/github/piasy/PRJ_PKG_NAME/PRJ_NAME.java $PRJ_NAME/src/main/java/$PKG_PATH/$PRJ_NAME.java
mv $PRJ_NAME/src/debug/java/com/github/piasy/PRJ_PKG_NAME/MainActivity.java $PRJ_NAME/src/debug/java/$PKG_PATH/MainActivity.java
mv $PRJ_NAME/src/debug/java/com/github/piasy/PRJ_PKG_NAME/MyApp.java $PRJ_NAME/src/debug/java/$PKG_PATH/MyApp.java

rmdir $PRJ_NAME/src/main/java/com/github/piasy/PRJ_PKG_NAME/ \
  $PRJ_NAME/src/debug/java/com/github/piasy/PRJ_PKG_NAME

sed -i '.bk' -e "s/PRJ_NAME/$PRJ_NAME/g" settings.gradle
sed -i '.bk' -e "s/PRJ_NAME/$PRJ_NAME/g" build.gradle
sed -i '.bk' -e "s/PRJ_PKG_NAME/$PRJ_PKG_NAME/g" build.gradle
sed -i '.bk' -e "s/PRJ_PKG_NAME/$PRJ_PKG_NAME/g" $PRJ_NAME/src/main/AndroidManifest.xml
sed -i '.bk' -e "s/PRJ_PKG_NAME/$PRJ_PKG_NAME/g" $PRJ_NAME/src/main/java/$PKG_PATH/$PRJ_NAME.java
sed -i '.bk' -e "s/PRJ_NAME/$PRJ_NAME/g" $PRJ_NAME/src/main/java/$PKG_PATH/$PRJ_NAME.java
sed -i '.bk' -e "s/PRJ_PKG_NAME/$PRJ_PKG_NAME/g" $PRJ_NAME/src/debug/AndroidManifest.xml
sed -i '.bk' -e "s/PRJ_NAME/$PRJ_NAME/g" $PRJ_NAME/src/debug/res/values/strings.xml
sed -i '.bk' -e "s/PRJ_PKG_NAME/$PRJ_PKG_NAME/g" $PRJ_NAME/src/debug/java/$PKG_PATH/MainActivity.java
sed -i '.bk' -e "s/PRJ_PKG_NAME/$PRJ_PKG_NAME/g" $PRJ_NAME/src/debug/java/$PKG_PATH/MyApp.java

rm settings.gradle.bk \
  build.gradle.bk \
  $PRJ_NAME/src/main/AndroidManifest.xml.bk \
  $PRJ_NAME/src/main/java/$PKG_PATH/$PRJ_NAME.java.bk \
  $PRJ_NAME/src/debug/AndroidManifest.xml.bk \
  $PRJ_NAME/src/debug/res/values/strings.xml.bk \
  $PRJ_NAME/src/debug/java/$PKG_PATH/MainActivity.java.bk \
  $PRJ_NAME/src/debug/java/$PKG_PATH/MyApp.java.bk
