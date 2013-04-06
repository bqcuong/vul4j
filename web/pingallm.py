#! /usr/bin/env python
import sys
import time
import os

hosts=['onosdevz1', 'onosdevz2', 'onosdevz3', 'onosdevz4', 'onosdevz5', 'onosdevz6', 'onosdevz7', 'onosdevz8']
filename = sys.argv[1]

ping_cnt=3
wait=ping_cnt

os.popen("rm -f /tmp/ping*")

f = open(filename, 'r')
nr_ping = 0
for line in f:
  if line[0] != "#":
    fid=int(line.strip().split()[0])
    src_dpid=line.strip().split()[2]
    dst_dpid=line.strip().split()[4]
    src_nwid=int(src_dpid.split(':')[-2], 16)
    dst_nwid=int(dst_dpid.split(':')[-2], 16)
    src_hostid=int(src_dpid.split(':')[-1], 16)
    dst_hostid=int(dst_dpid.split(':')[-1], 16)
    cmd="echo \"192.168.%d.%d -> 192.168.%d.%d\" > /tmp/ping.%d" % (src_nwid, src_hostid, dst_nwid, dst_hostid,fid)
    os.popen(cmd)
    cmd="ssh %s \'${HOME}/ONOS/test-network/mininet/mrun host%d \'ping -c %d -W 1 192.168.%d.%d\'\' >> /tmp/ping.%d 2>&1 &" % (hosts[src_nwid-1], src_hostid, ping_cnt, dst_nwid, dst_hostid,fid)
#    print cmd
    result = os.popen(cmd).read()
    time.sleep(0.2)
    nr_ping = nr_ping + 1

print "waiting for ping(s) to finish (%d sec)" % (wait)
time.sleep(wait)
cmd="cat /tmp/ping.* | grep loss |wc -l"
wait_cnt=0
while 1:
  nr_done = int(os.popen(cmd).read())
  if nr_done == nr_ping or wait_cnt > 10:
    break
  print "%d ping finished" % nr_done
  time.sleep(1)
  wait_cnt += 1

cmd='cat /tmp/ping.* | grep " 0% packet loss" |wc -l'
nr_success = int(os.popen(cmd).read())

if nr_success != nr_ping:
  print "fail: %d ping(s) failed (finished %d total %d)" % (nr_done - nr_success, nr_done, nr_ping)
else:
  print "success: all %d ping(s) got through" % (nr_success)

for i in range(nr_ping):
  cmd="cat /tmp/ping.%d | grep loss | awk '{print $6}'" % (i+1)
  cmd2="cat /tmp/ping.%d | head -n 1" % (i+1)
  result = os.popen(cmd).read().strip()
  result2 = os.popen(cmd2).read().strip()
  if result != "0%":
    print "flow # %d fail (%s)" % (i+1, result2)

f.close()
