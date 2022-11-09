#!/bin/bash

echo "Building Magisk module"
# Make module.zip
cd build
file="modejs.zip"
rm -f "../$file"
zip -r "../$file" ./*
cd ..

ADB=$(adb devices | awk 'NR>1 {print $1}')
if test -n "$ADB"; then
    (# Isolate
        function magisk() {
            adb shell su -c "magisk $@"
        }

        function push() {
            adb push $@
        }

        echo "Push $file to $ADB"
        push "$PWD/$file" "sdcard/Download"

        echo "Installing $file module on $ADB"
        magisk --install-module "/sdcard/Download/$file"
    )
else
    echo "Can't install module via adb"
    exit $?
fi
