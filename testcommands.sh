#!/bin/bash
set -e

npm list -g | grep neu

echo "uninstalling neu"
npm uninstall -g @neutralinojs/neu
echo "installing neu 8.1.0"
npm install -g @neutralinojs/neu@8.1.0
echo "check neu version"
neu version
echo "Add plugin"
neu plugins --add @neutralinojs/appify

echo "check if its added in which node_modules"
pwd


echo "updating neu"
npm install -g @neutralinojs/neu

echo "list plugins"
neu plugins
