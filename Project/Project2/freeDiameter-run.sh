#!/bin/bash -x

DATE=`date +%Y%m%d-%H%M%S`;
HOST=`hostname --fqdn`;

ulimit -c 1000000
rm -f core*

pushd freeDiameter
make
popd

echo fd-$HOST-$DATE.log > /home/aaa/logs/LATEST-$HOST-fd.log
/root/freeDiameter/freeDiameterd/freeDiameterd -dd $* 2>&1 | tee -i /home/aaa/logs/fd-$HOST-$DATE.log
