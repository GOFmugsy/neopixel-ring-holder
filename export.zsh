#!/bin/zsh
hash=`git rev-parse --short HEAD`
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o neopixel-rpi-light-ring-$hash.stl neo-holder-scad.scad
