#!/bin/sh -l

echo "\nHello.\n"

npm install && npm run build

cf login -a "$1" -o "$2" -u "$3"  -p "$4"  -s "$5"
cf deploy mta_archives/archive.mtar --retries 1

cf logout
