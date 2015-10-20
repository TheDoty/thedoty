#!/bin/bash

PHOTO=$(pwd)/$1

rails console production <<EOF
photo = Photo.new
photo.photo = File.open('$PHOTO')
photo.save!
quit
EOF
