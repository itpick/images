# rabbitmq
# =============
# RabbitMQ - Message broker
# https://www.rabbitmq.com/
#
# RabbitMQ is the most widely deployed open source message broker
# supporting multiple messaging protocols.

{ mkImage, pkgs, lib, ... }:

let
  # RabbitMQ ran with cmd=[], but the broker CrashLoops in a nonroot pod: Erlang
  # can't write $HOME/.erlang.cookie (HOME=/ is read-only), and the Mnesia/log
  # dirs default under non-writable paths. Point HOME + the Mnesia/log dirs at
  # the writable /tmp (via env below) and use a docker-entrypoint that
  # pre-creates them (RabbitMQ doesn't create the parents) then execs the broker.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.rabbitmq-server pkgs.coreutils ];
    text = builtins.readFile ./docker-entrypoint.sh;
  };
in
mkImage {
  drv = pkgs.rabbitmq-server;
  name = "rabbitmq";
  tag = "v${pkgs.rabbitmq-server.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [];

  env = {
    HOME = "/tmp/rabbitmq/home";
    RABBITMQ_MNESIA_BASE = "/tmp/rabbitmq/mnesia";
    RABBITMQ_LOG_BASE = "/tmp/rabbitmq/log";
    RABBITMQ_ENABLED_PLUGINS_FILE = "/tmp/rabbitmq/enabled_plugins";
  };

  extraPkgs = with pkgs; [
    bash
    erlang
    cacert
    entrypoint
  ];

  labels = {
    "org.opencontainers.image.title" = "RabbitMQ";
    "org.opencontainers.image.description" = "Open source message broker";
    "org.opencontainers.image.version" = pkgs.rabbitmq-server.version;
  };
}
