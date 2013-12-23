#!/bin/sh

# source this file in project root to get PATH set right

which sencha >/dev/null
if [ $? -gt 0 ]; then
    export PATH=$PWD/Sencha/Cmd/4.0.1.45:$PATH
fi

which cordova >/dev/null
if [ $? -gt 0 ]; then
    export PATH=$PWD/node_modules/cordova/bin:$PATH
fi

which grunt >/dev/null
if [ $? -gt 0 ]; then
    export PATH=$PWD/node_modules/grunt-cli/bin:$PATH
fi

echo $PATH | tr ':' '\n'
