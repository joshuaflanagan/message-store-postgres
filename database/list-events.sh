#!/usr/bin/env bash

set -e

clear

echo
echo "Listing Events"
echo "= = ="
echo

default_name=eventsource

if [ -z ${DATABASE_USER+x} ]; then
  echo "(DATABASE_USER is not set)"
  user=$default_name
else
  user=$DATABASE_USER
fi
echo "Database user is: $user"

if [ -z ${DATABASE_NAME+x} ]; then
  echo "(DATABASE_NAME is not set)"
  database=$default_name
else
  database=$DATABASE_NAME
fi
echo "Database name is: $database"

echo

function select-all-events {
  psql $database -c "SELECT * FROM events"
}

select-all-events
