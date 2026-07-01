{ mkImage, pkgs, lib, ... }:

# rabbitmq-nixchart
# =================
# RabbitMQ 4.2.5 (nixpkgs) for consumption by the charts/rabbitmq chart.
#
# Runs rabbitmq-server in the foreground. Chart passes RABBITMQ_*
# env vars — rabbitmq honours most of them natively
# (RABBITMQ_NODENAME, RABBITMQ_ERLANG_COOKIE, etc.).
# Additional Bitnami-specific keys (RABBITMQ_LOAD_DEFINITIONS,
# RABBITMQ_PLUGINS) are unsupported here.

let
  version = pkgs.rabbitmq-server.version;
in
mkImage {
  drv = pkgs.buildEnv {
    name = "rabbitmq-nixchart-env";
    paths = with pkgs; [ rabbitmq-server bash coreutils cacert tzdata ];
  };

  name = "rabbitmq-nixchart";
  tag = "v${version}";

  entrypoint = [ "${pkgs.rabbitmq-server}/bin/rabbitmq-server" ];
  cmd = [];
  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "rabbitmq-nixchart";
    "org.opencontainers.image.description" = "RabbitMQ image tuned for the nix-containers charts/rabbitmq chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rabbitmq";
  };
}
