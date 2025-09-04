#!/bin/bash
# count the number of failded logins by ip address
#if there are more than 10 failed logins from the same ip address, block it using iptables
cat /var/log/auth.log | grep "Failed password" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | awk '$1 > 10 {print $2}' | while read ip; do
    iptables -A INPUT -s $ip -j DROP
    echo "Blocked IP: $ip"
done
# end of script
