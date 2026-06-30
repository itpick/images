{ mkImage, pkgs, lib, ... }:

# TigerBeetle - Financial accounting database
# https://tigerbeetle.com/

let
  # TigerBeetle is a two-step server: `format` creates the replica data file,
  # then `start` runs it. The cmd was `version` (a one-shot, so the kind-test
  # pod CrashLoops). Use a docker-entrypoint that formats on first boot then
  # execs the server (modelled on images/postgres / images/mysql), so the bare
  # image comes up as a single-node replica listening on 0.0.0.0:3000.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.tigerbeetle ];
    text = builtins.readFile ./docker-entrypoint.sh;
  };
in
mkImage {
  drv = pkgs.tigerbeetle;
  name = "tigerbeetle";
  tag = "v${pkgs.tigerbeetle.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [];

  extraPkgs = [ entrypoint ];

  labels = {
    "org.opencontainers.image.title" = "TigerBeetle";
    "org.opencontainers.image.description" = "Financial accounting database";
    "org.opencontainers.image.version" = pkgs.tigerbeetle.version;
  };
}
