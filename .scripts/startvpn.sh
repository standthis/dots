  #!/bin/bash
  
# Start xl2tp vpn client
  /usr/bin/systemctl start openswan.service
  ipsec auto --add L2TP-PSK
  sleep 5                                                   #delay to ensure that IPsec is started before overlaying L2TP
  /usr/bin/systemctl start xl2tpd
  /usr/bin/ipsec auto --up L2TP-PSK                        
  /usr/bin/echo "c vpn-connection" > /var/run/xl2tpd/l2tp-control     
  sleep 120                                                   #delay again to make that the PPP connection is up.
  #PPP_GW_ADD=`./getip.sh ppp0`
  
  ip route add 146.231.123.155 via 146.231.8.2 dev ppp0
  #ip route add 68.68.32.79 via 192.168.1.1 dev eth0
  #ip route add default via $PPP_GW_ADD
  #ip route del default via 192.168.1.1
