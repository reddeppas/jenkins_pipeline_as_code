#!/usr/bin/env bash

set -x
nohup ./gradlew npm_start > /dev/null 2>&1 &
sleep 1
echo $! > .pidfile
echo 'Now...'
echo 'Visit http://localhost:3000 to see your Node.js/React application in action.'

