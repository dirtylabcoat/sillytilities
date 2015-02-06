#!/bin/bash
# Kill process with name PROCNAME and
# using more than CPULIMIT in CPU.

PROCNAME=$1
CPULIMIT=$2

# Sort procs by CPU-usage, output PID
PIDS=$(ps -C $PROCNAME -o %cpu,pid | grep -v PID | sort -r | awk '{print $2}')
for P in $PIDS; do
  CPU=$(ps -p $P -o %cpu | grep -v CPU)
  echo "Proc: $PROCNAME ($P), CPU: $CPU, CPULIMIT: $CPULIMIT"
  if [ $(echo "$CPU > $CPULIMIT" | bc) -gt 0 ]; then
    kill -9 $P 2>&1 /dev/null # I don't wanna hear about your problems, just kill it.
    echo "Killed proc $P ($1) for using $CPU CPU."
  fi
done

