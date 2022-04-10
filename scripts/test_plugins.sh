#!/bin/bash
set -e

# Script to check if updating neu cli removes previously installed plugins

echoGreen(){
    echo -e "\e[1;32m$1"
}

# Check if plugins remain after updating CLI

echoGreen "uninstalling current version of neu"
npm uninstall -g @neutralinojs/neu
echoGreen "installing neu 8.1.0 (older version)"
npm install -g @neutralinojs/neu@8.1.0
echoGreen "check neu version"
neu version

echoGreen "Add plugin"
neu plugins --add @neutralinojs/appify
 
echoGreen "updating neu"
npm install -g @neutralinojs/neu
 
npm link

# Check if list of plugins has previously installed plugins 
# Attempt to install plugin occurs

echoGreen "list plugins"
neu plugins

echoGreen "list plugins after reinstalling it"
neu plugins

echoGreen "Removing plugin to revert to initial state"
neu plugins --remove @neutralinojs/appify

echoGreen "list plugins after uninstalling it"
neu plugins
