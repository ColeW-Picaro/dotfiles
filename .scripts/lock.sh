#!/bin/bash

path="$(mktemp)"
import -window root $path.png
#My perefered config for corrupter
./Repos/corrupter/corrupter -mag 3 -lg 7 $path.png $path.png
i3lock -i $path.png
