# rabbitmq
# =============
# RabbitMQ - Message broker
# https://www.rabbitmq.com/
#
# RabbitMQ is the most widely deployed open source message broker
# supporting multiple messaging protocols.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.rabbitmq-server;
  name = "rabbitmq";
  tag = "v${pkgs.rabbitmq-server.version}";
  entrypoint = [ "${pkgs.rabbitmq-server}/bin/rabbitmq-server" ];
  cmd = [];

  extraPkgs = with pkgs; [
    bash
    erlang
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "RabbitMQ";
    "org.opencontainers.image.description" = "Open source message broker";
    "org.opencontainers.image.version" = pkgs.rabbitmq-server.version;
  };
}
