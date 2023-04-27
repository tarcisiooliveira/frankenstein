#!/bin/bash

SECRETS_CLI=true # Placeholder command, it will do nothing

set -e

eval $( $SECRETS_CLI get-secrets --name $PROJECT ) bundle exec rake db:migrate
