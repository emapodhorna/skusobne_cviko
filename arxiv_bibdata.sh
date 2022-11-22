#!/usr/bin/env bash

PREM="https://arxiv.org/abs/"

for ARG in "$@"
do
	PREM="$PREM$ARG"
	curl -s "$PREM" | tr -d '\n' | tr '<' '\n' | grep 'meta name="citation_' | sed 's/" content=/=/' | sed 's/meta name="citation_//' | sed 's/\/>//' 
	PREM="https://arxiv.org/abs/"
	echo -e '\n'
	shift
done


 
