# bashbackups
virtualbox vboxmanage bash backups

This very simple bash file create a history of snapshots of diferente virtual machines, clone those machines save all in a log file and reboot the host
You can select the amount of snapshots, it is working with 7 snapshots to run it in a crontab every day but you can change it, also it delete the oldes snapshot
The script must to be executed with root user, also change the name of the virtual machines to make it work and change the name of "NoRootUser" with a no root user as well

Be sure to have a /home/logs folder created

Regards
