#!/bin/bash


function run
{
	echo "start run .........."
i=0
	while [ $i -le 9 ]; do
		/usr/local/redis/bin/redis-server /usr/local/redis/etc1/redis$i.conf
		#/usr/local/redis/bin/redis-cli -h -p 600$i 
		#/usr/local/redis/bin/redis-cli config set requirepass xintu
		#/usr/local/redis/bin/redis-cli shutdown
		i=$(($i+1))
		por=$(($i+6000))
		echo $por
	done
		/usr/local/redis/bin/redis-server /usr/local/redis/etc1/redis6100.conf
		/usr/local/redis/bin/redis-server /usr/local/redis/etc1/redis6200.conf
	echo "run finish .........."
}
run
