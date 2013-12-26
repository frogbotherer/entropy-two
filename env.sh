#!/bin/sh

# source this file in project root to get PATH set right

which sencha >/dev/null
if [ $? -gt 0 ]; then
    export PATH=/opt/Sencha/Cmd/4.0.1.45:$PATH
fi
DATA="cordova:cordova grunt:grunt-cli coffee:coffee-script node-sass:node-sass ripple:ripple-emulator jasmine-node:jasmine-node"
for X in `echo $DATA`; do
    EXE=`echo $X|cut -d: -f1`
    DIR=`echo $X|cut -d: -f2`
    which $EXE >/dev/null
    if [ $? -gt 0 ]; then
        export PATH=$PWD/node_modules/$DIR/bin:$PATH
    fi
done

echo $PATH | tr ':' '\n'
