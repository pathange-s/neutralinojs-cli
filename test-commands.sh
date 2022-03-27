#!/bin/bash
set -e

mkdir testNeuCLI
cd testNeuCLI

# NEU

commandRun(){
    echo -e "\e[1;32mCommand Run: $1\e[0m"
}

echo -e "\e[1;32mTesting Neutralino CLI commands\n"

commandRun "neu --help"
neu --help
echo

# CREATE

commandRun "neu create <app name>"
neu create myapp
echo

commandRun "neu create <app name> --template <template>"
neu create myapp2 --template neutralinojs/neutralinojs-zero
echo

commandRun "neu create --help"
neu create --help
echo

# VERSION (global version)

commandRun "neu version"
neu version
echo

# RUN

echo -e "\e[1;33mCreating sample app before running neu run & neu build"
neu create .
echo

commandRun "neu run"
neu run
echo

commandRun "neu run --disable-auto-reload"
neu run --disable-auto-reload
echo

commandRun "neu run --arch"
neu run --arch x64
echo

echo -e "\e[1;33mCreating environment to run neu with flag --frontend-lib-dev"
git clone https://github.com/pathange-s/neutralinojs-react.git
echo
cd neutralinojs-react && cd myapp-react && gnome-terminal -- npm start

commandRun "neu run --frontend-lib-dev"
until [ ! -z "$(sudo netstat -tulpn | grep :3000)" ];
do
  echo "starting development server"
  sleep 1s
done
cd .. && neu run --frontend-lib-dev
echo

commandRun "neu run --help"
neu run --help
echo

# BUILD

commandRun "neu build"
neu build
echo

commandRun "neu build --release"
neu build --release
echo

echo -e "\e[1;33mCreating .storage directory before running neu build --copy-storage"
mkdir .storage
echo

commandRun "neu build --copy-storage"
neu build --copy-storage
echo

commandRun "neu build --help"
neu build --help
echo

# UPDATE

commandRun "neu update"
neu update
echo

# VERSION (in neu project)

commandRun "neu version"
neu version
echo

# PLUGINs

commandRun "neu plugins --add <plugin>"
neu plugins --add @neutralinojs/appify
echo

commandRun "neu plugins --remove <plugin>"
neu plugins --remove @neutralinojs/appify
echo

commandRun "neu plugins --help"
neu plugins --help
echo

sudo rm -r ../testNeuCLI