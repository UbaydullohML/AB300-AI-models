ifconfig eth1 inet 192.168.241.100 netmask 255.255.255.0
#iptables -t nat -A PREROUTING -i rmnet_mhi0.1 -p tcp --dport 554 -j DNAT --to-destination 192.168.2.119:554
#iptables -t nat -A PREROUTING -i rmnet_mhi0.1 -p udp --dport 554 -j DNAT --to-destination 192.168.2.119:554
#iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 554 -j DNAT --to-destination 192.168.2.119:554
#iptables -t nat -A PREROUTING -i wlan0 -p udp --dport 554 -j DNAT --to-destination 192.168.2.119:554
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 554 -j DNAT --to-destination 192.168.241.1:554
iptables -t nat -A PREROUTING -i eth0 -p udp --dport 554 -j DNAT --to-destination 192.168.241.1:554

#iptables -t nat -A POSTROUTING -o rmnet_mhi0.1 -s 10.200.200.111/24 -j MASQUERADE
iptables -A FORWARD -p tcp -d 192.168.241.1 --dport 554 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING  -j MASQUERADE