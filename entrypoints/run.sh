#!/bin/bash

SECRETS_CLI=true # Placeholder command, it will do nothing

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

eval $( $SECRETS_CLI get-secrets --name $PROJECT ) bundle exec rails s -p 3000 -b 0.0.0.0
