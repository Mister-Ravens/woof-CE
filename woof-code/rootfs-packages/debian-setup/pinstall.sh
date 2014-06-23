#!/bin/sh
# Debian/Ubuntu specific modifications
#

rm -f etc/init.d/udev                   # puppy already starts udev in rc.sysinit
rm usr/bin/X; ln -sf Xorg usr/bin/X     # delete useless xorg wrapper
ln -s xterm usr/bin/x-terminal-emulator # some programs look for this symlink

echo Generating locale files
chroot . /usr/bin/localedef --no-archive -i en_US en_US
chroot . /usr/bin/localedef --no-archive -i en_AU en_AU
chroot . /usr/bin/localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8
chroot . /usr/bin/localedef --no-archive -i en_AU -f UTF-8 en_AU.UTF-8
