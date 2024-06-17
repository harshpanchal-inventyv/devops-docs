#todo: Linux Networking

#? 1) ping command (The cornerstone of network reachability testing, ping sends ICMP echo requests to a specified hostname or IP address.)
# ping [dns_name] (eg - google.com)
# ping [ip_address]

#? 2) nslookup (nslookup queries a DNS server to translate a hostname (like google.com) into its corresponding IP address)
# nslookup [dns_name]

#? 3) ifconfig/ip addr (For network interface details, ifconfig (on older systems) or ip addr (on newer ones) is your go-to command. It displays information about your network interfaces, including IP addresses, MAC addresses, and interface status.)
# ifconfig
# ip addr

#? 4) netstat (netstat offers a comprehensive view of your network activity. It displays active connections, listening ports, and traffic statistics, giving you insights into network utilization and potential issues)
# netstat -a (view all network connections)
# netstat -ltpn (lists all listening TCP ports with process ID and names)

#? 5) traceroute (It traces the route packets take to reach a destination, revealing the network hops involved.)
# traceroute [dns_name]

#? 6) ip (ip offers a powerful suite of commands for managing network configuration, including assigning IP addresses, setting up routes, and manipulating firewall rules.)
# ip route add default via 192.168.1.1  # Add a default route
# ip address add 10.0.0.1/24 dev eth0  # Assign an IP address to an interface

#? 7) tcpdump (It captures network traffic on a specified interface, allowing you to examine individual packets and analyze network protocols)
# tcpdump -i eth0  # Capture packets on interface eth0

#? 8) ssh (It allows you to establish a secure connection to another Linux machine and execute commands as if you were logged in locally.)
# ssh user@remote_server_ip  # Connect to a remote server as user 

#? 9) nmap (Used to check target system net configuration)
# For comprehensive network reconnaissance and security auditing, nmap reigns supreme. It scans target systems to identify:
# Open ports: These are potential entry points for communication.
# Services running on those ports: This reveals what applications or protocols are using the ports.
# Operating systems (OS) and device types: nmap can often fingerprint the target system's OS based on its responses. 
#^List of commands
# nmap [dns_name OR ip_address] (Basic scan to identify open ports on a target)
# nmap -A [dns_name OR ip_address] (Gives in detail information about the target machine)

#? 10) iptables/nftables(firewall) (For network security, Linux firewalls like iptables (legacy) or nftables (newer) are essential. They control incoming and outgoing network traffic based on predefined rules, protecting your system from unauthorized access.) 

# iptables -A INPUT -p tcp --dport 22 -j ACCEPT  (Allow incoming SSH connections)
# iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT  (Allow outgoing traffic to port 80 (HTTP))

#? 11) ifplugstatus (List the network interface, with a option that it is working or not) 
# ifplugstatus

#? 12) telnet (use to communicate with other server or remote server) 
# telnet [server_ip OR dns_address] [port]
