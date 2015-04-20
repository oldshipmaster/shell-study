#!/bin/bash
	echo "stop ............."
for pid  in `ls \/usr\/local\/redis\/pid| grep pid` ;
do
        echo "Kill "$pid
        kill -s KILL `cat \/usr\/local\/redis\/pid\/$pid`
done
	echo "stop finish ............"
