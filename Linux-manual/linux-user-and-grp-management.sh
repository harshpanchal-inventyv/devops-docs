#todo: Linux User & Group Management

#? Contents
# ~ 1) Creating a user (useradd)
# ~ 2) Deleting a user from system (userdel)
# ~ 3) Information about user and passwords 
# ~ 4) Modification of user account (usermod)
# ~ 5) Change shell of user (chsh)
# ~ 6) Create & delete group (groupadd & groupdel)
# ~ 7) Modification of group (groupmod)
# ~ 8) Information about groups
# ~ 9) Password for group (gpasswd)
# ~ 10) Connect time for all users or specified  (ac)
# ~ 11) Switching between users (su)

#? 1) Creating a user

# (user creation)
# useradd <user_name> (adds user to system without home and spool directory)
# useradd -m <user_name> (adds user to system with home and spool directory)

# (user password creation)
# passwd <user_name> (sets password for user after creating it)

#? 2) Deleting a user from system

# userdel <user_name> (delete user from system)

# userdel -r <user_name> (delete user from system along with home and spool directories)

#? 3) Information about user and passwords 

# /etc/passwd (stores information about user accounts)
# /etc/shadow (stores the password for user in encrypted format)

#? 4) Modification of user account

# usermod -aG <grp_name> <user_name> (adds user to a group)
# usermod -G <list_of_groups> <username> (removes user from groups)
# usermod -L username (locks the user account)
# usermod -U username (unlocks the user account)
# usermod -e YYYY-MM-DD username (sets expiry for account)

#? 5) Change shell of user

# chsh -s /bin/bash <user> (changing to bash)
# chsh -s /bin/sh <user> (changing to sh)

#? 6) Create & delete group

# groupadd <group_name> (creates the group)
# groupdel <group_name> (deletes the group)

#? 7) Modification of group

# sudo groupmod -n <new_groupname> <old_groupname> (change the group name)
# sudo groupmod -m -A username groupname (add user to group)
# sudo groupmod -m -R username groupname (remove user from group)
# sudo groupmod -L groupname (locks the group)
# sudo groupmod -U groupname (unlocks the group)
# sudo groupmod -e YYYY-MM-DD groupname (expiration on group)


#? 8) Information about groups

# /etc/group

#? 9) Password for group

# gpasswd <grp_name> (creates a password for groups)
# gpasswd -a <user_name> <grp_name> (adds user to group)
# gpasswd -d <user_name> <grp_name> (remove user from group)
# gpasswd -M <user_name1>,<user_name2>,<user_name3> <grp_name> (adds multiple users to the group and removes the existing ones of the group)

#? 10) Connect time for all users or specified users

# The ac command reads the /var/log/wtmp file, which contains binary data about every login, logout, system event, and current status on the system. It gets its data from the wtmp file.

# ac <user_name> (displays the total login time for user)
# ac -p (displays totol login time for each users)
# ac -d (displays totol login time for each day)

#? 11) Switching between users

# su <user_name> (switching to mentioned user)
# exit (logout from current user)
