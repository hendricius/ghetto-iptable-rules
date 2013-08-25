#!/bin/bash

/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# SSH
/sbin/iptables -A INPUT -p tcp -m tcp --dport ssh -j ACCEPT

# Example to allow accessing a local port via ssh
# /sbin/iptables -A INPUT -p tcp -s 127.0.0.1 -m tcp --dport 10000 -j ACCEPT
# Then log in via ssh: ssh x@x.com -L 10000:localhost:10000
# /sbin/iptables -A INPUT -p tcp -m tcp --dport https -j ACCEPT
# /sbin/iptables -A INPUT -p tcp -m tcp --dport http -j ACCEPT

# Rails
# /sbin/iptables -A INPUT -p tcp -m tcp --dport 3000 -j ACCEPT
# /sbin/iptables -A INPUT -p tcp -m tcp --dport 3001 -j ACCEPT

# VPN, for running a openvpn server
# /sbin/iptables -A INPUT -i eth0 -p udp --dport 1194 -j ACCEPT
# /sbin/iptables -A OUTPUT -o eth0 -p udp --dport 1194 -j ACCEPT
# /sbin/iptables -A INPUT -i tun0 -j ACCEPT
# /sbin/iptables -A OUTPUT -o tun0 -j ACCEPT
# /sbin/iptables -A FORWARD -o tun0 -j ACCEPT

# Redirecting a local port to another IP:
# /sbin/iptables -t nat -A POSTROUTING -j MASQUERADE
# /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 1.1.1.1:80


# Default policies
/sbin/iptables -P INPUT DROP

# Except all when hosting virtual machines
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables -F FORWARD

# Else you want to
# /sbin/iptables -P FORWARD DROP

/sbin/iptables -P OUTPUT ACCEPT
