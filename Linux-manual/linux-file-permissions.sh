#todo: Linux File Permissions

#? Contents
# ~ 1) Understanding for permission bits
# ~ 2) Listing permissions for file/dir (using ls)
# ~ 3) Changing permissions for file/dir (using chmod)
# ~ 4) Changing user ownership for file (using chown)
# ~ 5) Changing group ownership for file/dir (using chgrp)
# ~ 6) Concepts for access control list (using setfacl & getfacl)


#? 1) Understanding for permission bits
# <owner_bits> - <grp_bits> - <others_bits> (eg - (u)rwx-(g)rw-(o)r)
# Read permission - 4
# Write permission - 2
# Execute permission - 1

# By default permission of file - 664 and directory - 775 (non-root user)

#? 2) Listing permissions for file/dir
# ls -l (permissions for file)
# ls -ld <directory_name> (permissions for directory)

#? 3) Changing permissions for file/dir
# chmod <permission_bits> <file_name> (eg = chmod 644 <file_name>)
# chmod <permission_bits> -R <directory_name> (sets the given permission for all files inside the directory and changes the directory permissions as well)

# Allocation for permission(another method apart from bits) -> [u+wr,g+r,o+r](alloted permission), [u-wr,g-r,o-r](removed permission)

#? 4) Changing user ownership for file
# chown <user_name> <file_name>
# chown <user_name>:<grp_name> <file_name> (This can change both the user and group of a particular file)

#? 5) Changing group ownership for file/dir
# chgrp <grp_name> <file_name/dir_name>

#? 6) Concepts for access control list (setfacl & getfacl)
# setfacl -m u:<user_name>:rwx <file_name/dir_name> (allots the given permission to file for specific user, not for all users)
# setfacl -x u:<user_name>: <file_name/dir_name> (removes the alloted permission to file for specific user not for all users)

# setfacl -m g:<grp_name>:rwx <file_name/dir_name> (allots the given permission to file for specific grp, not for all users)
# setfacl -x g:<grp_name>: <file_name/dir_name> (removes the alloted permission to file for specific grp not for all users)

# getfacl <file_name/dir_name> (It will list the access control list for specific file or directory)

#? 7) Default permission for file & directories
# umask [permission_bits] (It will set the default permission for file and directories so when a new file or dir was created using this umask provided permission)

# Default max permission for file - 666 and for directory - 777
# so if you apply umask with bits then they get substracted from max permission eg if you want to give permission like 644 then you must set umask as [umask 022] as max permission for file is 666.