#!/usr/bin/env bash

PREM="https://arxiv.org/abs/"

while [ "$#" != 0 ]
do
	for x in "$@"
	do
		PREM="$PREM$x"
		curl -s "$PREM" | tr -d '\n' | tr '<' '\n' | grep 'meta name="citation' | sed 's/" content=/=/' | sed 's/meta name="citation_//' | sed 's/\/>//' 
	done
shift
done


 
