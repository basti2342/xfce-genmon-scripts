SSHFS monitor
=============

I use ssh chroots to give people access to certain files. I want to get an idea what uses my outgoing speed, so I wrote a short script that returns bandwidth used by the ssh chroot user. The generic monitor draws a bar with the used bandwidth percentage right next to my network monitor bars.

Note: iotop as non-root is a security risk. I run sshfsmon.sh as root (started using crontab @reboot) and let it write the output to a file in the ssh chroot homedir in an endless loop and use `cat` in the generic monitor widget. Don't forget to set read permissions on the temporary file for your user.
