#!/bin/bash

set -e
set -x

sizes="16 32 48 128 256 512"

#cp /usr/share/pixmaps/fedora-logo-sprite.svg logos/svg

for size in $sizes
do
  mkdir -p logos/png_$size
  # create png files
  convert -background none -resize ${size}x${size} -gravity center -extent ${size}x${size} logos/svg/fedora-logo-sprite.svg logos/png_$size/AsahiLinux_logomark.png
  # optional compression step
  #zopflipng -ym logos/png_$size/AsahiLinux_logomark.png logos/png_$size/AsahiLinux_logomark.png
  # create icns file
  png2icns logos/icns/AsahiLinux_logomark.icns logos/png_{16,32,48,128,256,512}/AsahiLinux_logomark.png
done

