# use netfilter-persistent
# saved to /etc/iptables/rules.v4

#iptable --table nat # use this to show the rules

iptables -A PREROUTING -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 8081
iptables -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8082
netfilter-persistent save
