#!/bin/bash

function cpcp
{
	echo "Starting deploy.........."
i=0
	while [ $i -le 9 ];do
		echo $i
		cp redis.conf redis$i.conf
		if [ ! -d redis_dir$i ]; then
			mkdir redis_dir$i
		fi
		i=$(($i+1))
	done
	data_cache
rp	
}

function data_cache
{
	cp redis.conf redis6100.conf
	cp redis.conf redis6200.conf
	if [ ! -d redis_dir6100 ]; then
		mkdir redis_dir6100
	fi
	if [ ! -d redis_dir6200 ]; then
		mkdir redis_dir6200
	fi
}

function rp
{
i=0
	while [ $i -le 9 ];do

		por=$(($i+6000))
		#替换端口
		sed -i "s/port 6379/port $por/g" redis$i.conf
		#替换实例pid文件
		sed -i "s/pidfile \/var\/run\/redis.pid/pidfile \/usr\/local\/redis\/pid\/redis$i.pid/g" redis$i.conf
		#创建目录
		sed -i "s/dir .\//dir \/usr\/local\/redis\/etc1\/redis_dir$i/g" redis$i.conf
		#创建数据文件目录
		#sed -i "s/dbfilename dump.rdb/dbfilename dump$i.rdb/g" redis$i.conf
		i=$(($i+1))
		echo $por
	done
	#替换data cache的端口
        	 sed -i "s/port 6379/port 6100/g" redis6100.conf
        	 sed -i "s/port 6379/port 6200/g" redis6200.conf
                #替换实例pid文件
                sed -i "s/pidfile \/var\/run\/redis.pid/pidfile \/usr\/local\/redis\/pid\/redis6100.pid/g" redis6100.conf
                sed -i "s/pidfile \/var\/run\/redis.pid/pidfile \/usr\/local\/redis\/pid\/redis6200.pid/g" redis6200.conf
                #创建目录
                sed -i "s/dir .\//dir \/usr\/local\/redis\/etc1\/redis_dir6100/g" redis6100.conf
                sed -i "s/dir .\//dir \/usr\/local\/redis\/etc1\/redis_dir6200/g" redis6200.conf
                #创建数据文件目录
                #sed -i "s/dbfilename dump.rdb/dbfilename dump$i.rdb/g" redis$i.conf
                #sed -i "s/dbfilename dump.rdb/dbfilename dump$i.rdb/g" redis$i.conf
	echo "deploy  finish........."
		
}
cpcp
