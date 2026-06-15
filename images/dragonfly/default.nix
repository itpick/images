{ mkImage, pkgs, lib, ... }:

# DragonflyDB - Modern Redis/Memcached replacement
# https://www.dragonflydb.io/

let
  # The upstream docker.dragonflydb.io/dragonflydb/dragonfly image ships
  # /usr/local/bin/healthcheck.sh, and the official dragonfly helm chart's
  # readiness + liveness probes exec it verbatim. Without this file the
  # pod stays NotReady and gets killed by liveness:
  #
  #   /bin/sh: can't open '/usr/local/bin/healthcheck.sh': No such file
  #
  # Ship a verbatim copy via extraContents (busybox-compatible: sh +
  # netstat + nc + grep + cut, all in mkImage's default base layer).
  healthcheckCompat = pkgs.runCommand "dragonfly-healthcheck-compat" {} ''
    mkdir -p $out/usr/local/bin
    install -m 0755 ${./healthcheck.sh} $out/usr/local/bin/healthcheck.sh
  '';
in
mkImage {
  drv = pkgs.dragonflydb;
  name = "dragonfly";
  tag = "v${pkgs.dragonflydb.version}";
  entrypoint = [ "${pkgs.dragonflydb}/bin/dragonfly" ];
  cmd = [ "--version" ];

  extraContents = [ healthcheckCompat ];

  labels = {
    "org.opencontainers.image.title" = "DragonflyDB";
    "org.opencontainers.image.description" = "Modern replacement for Redis and Memcached";
    "org.opencontainers.image.version" = pkgs.dragonflydb.version;
  };
}
