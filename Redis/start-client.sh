#!/bin/sh
clear
# && docker exec -it redis redis-cli
until (clear && echo 'Welcome to Redis !!') 2> /dev/null; do sleep 5; done