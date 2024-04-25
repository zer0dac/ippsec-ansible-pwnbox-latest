#!/bin/bash
/bin/bash -c "timeout 45 /usr/bin/burpsuite < <(echo y) &" 
sleep 30
curl http://localhost:8080/cert -o /tmp/cacert.der
sudo apt install rsyslog
exit
