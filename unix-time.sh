#!/bin/sh

time=$(echo $1 | sed 's/\//-/g')
re='^[0-9]+$'

if [ "$time" != "" ]; then
	if [[ $time =~ $re ]]; then
		if [ "$time" -gt "9999999999" ]; then
			time=$(($time / 1000))
		fi

		if [ "$time" -gt "9999999999" ]; then
			time=$(($time / 1000))
		fi
		date -r $time
	else
		date -j -f "%F" $time "+%s"
	fi
else
	date +%s
fi

