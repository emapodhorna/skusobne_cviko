#!/usr/bin/env bash

PREM="https://arxiv.org/search/?query="

while [ "$#" != 0 ]
do
if [ "$#" == 1 ]
then
	PREM="$PREM$1&searchtype=all&source=header"
	shift
else
	PREM="$PREM$1+"
	shift
fi
done

curl -s "$PREM" | tr -d '\n' | tr '<' '\n' | grep '>arXiv:' | sed 's/a.*://' | sort | uniq 
