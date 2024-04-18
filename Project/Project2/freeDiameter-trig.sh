#!/bin/bash -x

# Usage: ./$0 [loop]
# If "loop" is specified on the command line, the signal
# will be sent every 10 seconds. Otherwise, it is only sent once.

# Note: if the daemon is restarted (changes its PID), this script
# must also be restarted.

PID=`ps --no-heading -C freeDiameterd -o '%p'`;
if [ "$1" = "loop" ];
then while (true); do sleep 10; kill -USR1 $PID; done;
else kill -USR1 $PID;
fi

