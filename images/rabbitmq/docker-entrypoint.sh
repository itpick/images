#!/usr/bin/env bash
set -euo pipefail

# RabbitMQ (Erlang) writes several things the nonroot pod can't put on the
# read-only root: the Erlang cookie at $HOME/.erlang.cookie, its Mnesia database
# under RABBITMQ_MNESIA_BASE, and logs under RABBITMQ_LOG_BASE. The image env
# points all three at the writable /tmp; RabbitMQ does not create the parent
# dirs itself, so pre-create them here, then exec the broker (which binds AMQP
# on 0.0.0.0:5672 by default).
mkdir -p "$HOME" "$RABBITMQ_MNESIA_BASE" "$RABBITMQ_LOG_BASE"

exec rabbitmq-server
