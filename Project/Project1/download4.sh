
#!/bin/bash

echo "D4 activated at $(date)" >> timelog.log
mkdir MS -p
cd MS
wget -vrk microsoft.com
