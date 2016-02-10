#!/bin/sh

counter=$(ls -1 /boot/initrd.img* |wc -l)
boot_partition=$(df -h |grep -c /boot)
if [ "$boot_partition" -gt "0" ]; then
    total_boot=$(df -h |grep -w "/boot$"|awk '{print $2}')
    free_boot=$(df -h |grep -w "/boot$"|awk '{print $4}')
    perc_boot=$(df -h |grep -w "/boot$"|awk '{print $5}')
    notify-send --hint=int:transient:1 -u normal  "INFO - Your /boot contains $counter kernel images's" "Free space is $free_boot of $total_boot (used  $perc_boot)"
else
    notify-send --hint=int:transient:1 -u normal  "INFO - Your /boot contains $counter kernel images's" 
fi
