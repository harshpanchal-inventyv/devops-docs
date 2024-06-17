#todo: Linux process monitoring


#? 1) List process

# ps (report a snapshot of the current processes.)
# ps aux (all running process with more details)
# ps -u <user_name> (process for specific user)
# ps -G <grp_name> (process for specific grp name)

#? 2) Shows the real-time, dynamic view of the running processes of a system

# top (command displays live processes and memory usage along with load average)
# top -H (Displays individual thread that are currently in the system. Without this command option, a summation of all thread in each process is displayed)
# btop (same as top but advance in terms of UI)
# htop (shows per-process memory usage in real time. It can report resident memory size (RSS), total program size in memory, library size, shared page size, and dirty page size for all running processes)
# atop (The atop command is an interactive system and process monitor for terminal environments. It shows a dynamically-updated summary of system resources (CPU, memory, network, I/O, kernel)

#? 3) Kill a process

# kill -l (displays list of code)
# kill [p_id] (kills a process)
#! Basic signals
# 1)-1: Restart the process 
# 2)-2: interrupt from keyboard like ctrl+can
# 3)-9: forcefully terminate
# 4)-15: kill process gracefully  

#? 4) Puts process in foreground and background
# fg [job_id] (puts the process to foreground)
# bg [job_id] (puts the process to background)
# [command] & (this syntax of putting & at last of any command, puts that command into background)

#? 5) Keep process running even after stopping terminal
# nohup [process] (nohup - no hangup)