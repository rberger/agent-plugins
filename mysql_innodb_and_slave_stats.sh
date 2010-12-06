#!/bin/bash

#just grabs innodb, lock tables, and slave lag for trending/graphing via cloudkick

echo "status ok ok"
mysql -ucloudkick -e 'show global status' |ruby -a -ne 'puts "metric " + $F[0] + " int " + $F[1] if $_ =~ /[^b]lock|innodb/i'
mysql -ucloudkick -e 'show slave status \G' |ruby -a -ne 'puts "metric slave_lag int " + $F[1] if $_ =~ /Seconds_Behind/'
