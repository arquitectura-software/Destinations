#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid

rake db:create
rake db:migrate
rake db:seed

rails server -b 0.0.0.0

exec "$@"