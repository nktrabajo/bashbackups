#!/bin/bash
log_file="$HOME/Logs/backups.log-`date +'%Y-%m-%d_%H-%M-%S'`"
[ -f "$log_file" ] || touch "$log_file"
exec 1>> $log_file 2>&1
echo $(date)

backup_script () {
echo Start Backup Process $VM - $(date)
sudo -u NoRootUser vboxmanage snapshot $VM delete "${VM}6"
echo Delete Snapshot $VM  - $(date)
for i in 6 5 4 3 2 1
do
n=$((i - 1))
sudo -u NoRootUser VBoxManage snapshot $VM edit "${VM}$n"  --name "${VM}$i"
done
sudo -u NoRootUser VBoxManage snapshot $VM take "${VM}0"
echo Create Snapshot $VM - $(date)
sudo -u NoRootUser VBoxManage unregistervm "${VM}0" --delete
echo Delete Clone $VM - $(date)
sudo -u NoRootUser VBoxManage clonevm $VM --name="${VM}0" --register --mode=machine --options=keepallmacs --options=keepdisknames --options=keephwuuids
echo Create Clone $VM - $(date)
echo End Backup $VM - $(date)
echo
}

for VM in "VirtualMachine1" "VirtualMachine2" "VirtualMachine3" "VirtualMachine4"
do
backup_script
done

echo Start Reboot
sudo reboot
