#todo: Linux Memory Management

#? Contents
# ~ 1) Display the system memory (main memory)
# ~ 2) Display the disk space usage of mounted file systems
# ~ 3) Display disk usage information of files/directories in human-readable format
# ~ 4) Information about memory usage

#? 1) Display the system memory (main memory)
# free -h (this command display sys. memory)
#! swap memory = [(main memory) + 2]GB (Max allocation)

#? 2) Display the disk space usage of mounted file systems
# df -h (report file system disk space usage) 

#? 3) Display disk usage information of files/directories in human-readable format
# du -h (report file system disk space usage) 

#? 4) Information about memory usage
# cat /proc/meminfo (file stores statistics about memory usage)

#? 5) Information about block devices & partition
# lsblk (lists the information about block devices)
# fdisk -l (display partitions)

#? 6) Information about partitions
# There are two main types of partitions: [primary] & [extended]
# extended partition can hold another partition in it and is known as logical partition 

#? 7) Manipulate disk partition table
#! Steps to make partition

# Basics - only 4 partition are allow primary, and only 1 extended allowed

# 1) Execeute {fdisk [path_to_disk]}
# 2) A interactive terminal was started then press m for menu, for creating new partition press n
# 3) After pressing n, it asks for primary(p) or extended(e) partition give input accordingly.
# 4) press enter for first sector, give the size as +nG to last sector (n -> any number)
# 5) Then it asks for partition number give accordingly
# 6) After that we can give t command to next prompt to change the type of file system (for menu press L)
# 7) After doing that press w for writable to make your changes and then you are exited from interactive session and in terminal give command [partprobe]
# 8) If you have choosen e as a option for extended partition then it will ask you for logical partition in next time when you came across that prompt

#! Steps to delete partition
# 1) Execeute {fdisk [path_to_disk]}
# 2) press d for delete partition
# 3) In the next prompt give the partition number

#! Attaching the memory to any file or directory
# 1) Firstly to mount a partition or memory to a file/directory, its require to assign a filesystem type using commad like {mkfs.ext3 [partition_location]}
# 2) Now it can be mount, { mount [partition_name] [directory_path] }
# 3) As the mounting is not permanent it will flush away when server restarts, to make it permanent add this configuration to [/etc/fstab] file
# Configuration to add like -> { [path_to_partition_name] [directory_to_which_partition_mounted] [file_system -> ext3 or any] defaults 0 0 }
# 4) To unmount that directory from assigned memory it can be done as, { umount [directory_path] }

#! To make a partition as swap space (swap space can be [main memory + 2GB])
# 1) Use command : mkswap [partition_name]

#? 8) Memory management using LVM

# 1) Add a disk and then make a partition using fdisk command. 
# 2) After creating partition make a physical volume (pv) { command : pvcreate [block_device_path] }
# 3) Then make a volume group if not available { command : vgcreate [name_of_vg] [block_device_path] }
# 4) Now we have all things done start making logical volume(lv) { command : lvcreate -L +2000M -n [logical_volume_name] [volume_grp_name] }
# 5) To make use of that lv, it is required to attach a filesystem so that it can be mounted on a directory { command : mkfs.ext4 [path_to_lv] }
# 6) Now it can be mounted to a directory
# 7) to increase the space of lv it can be done through lvextend command by adding that new partition to vg using vgextend command 
# 8) To apply file system to that new space lv it acn be done through resizefs command
# 9) to display lv and pv, lvdisplay and pvdisplay can be used