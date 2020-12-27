#!/bin/sh

nvidia-settings --load-config-only

/home/pneisen/.local/bin/dropbox.py start

/home/pneisen/.fehbg

picom -b --unredir-if-possible

dwmblocks &
