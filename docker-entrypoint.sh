#!/bin/sh

if [ "$1" = "" ]; then
  # This works if CMD is empty or not specified in Dockerfile
  exec asterisk -c
else
  exec "$@"
fi

