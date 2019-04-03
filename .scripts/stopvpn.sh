  #!/bin/bash
  
  /usr/bin/ipsec auto --down L2TP-PSK
  /usr/bin/echo "d vpn-connection" > /var/run/xl2tpd/l2tp-control
  /usr/bin/xl2tpd stop
  /usr/bin/openswan stop
  
  ip route del 146.231.123.155 via 146.231.8.2 dev ppp0
  #ip route del 68.68.32.79 via 192.168.1.1 dev eth0
  #ip route add default via 192.168.1.1
