#!/usr/bin/env bash
set -eu

HUGO_VERSION=v0.62.2
if $(docker image ls tiryoh/hugo | grep -q hugo); then
	: # do nothing
else
	cd docker && docker build -t tiryoh/hugo:$HUGO_VERSION .
fi
docker run --rm -it -p 1313:1313 -v $(pwd):/src tiryoh/hugo:$HUGO_VERSION server --bind=0.0.0.0
