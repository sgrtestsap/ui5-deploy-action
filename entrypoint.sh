#!/bin/sh -l

echo "\nHello.\n"
cf login -a "$1" -o "$2" -u "$3" -p "$4" -s "$5"

npm run build && npm run deploy

cf logout
