
#!/bin/bash

echo "D2 activated at $(date)" >> timelog.log
mkdir -p VSB
cd VSB
wget -vrk vsb.cz
wget -vrk edison.sso.vsb.cz

