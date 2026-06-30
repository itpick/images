{ mkImage, pkgs, lib, ... }:

# Kubo (IPFS) - Interplanetary File System
# https://ipfs.tech/

let
  # Kubo is a two-step server: `ipfs init` creates the repo, then `ipfs daemon`
  # runs it. The cmd was `version` (a one-shot, so the kind-test pod
  # CrashLoops). Use a docker-entrypoint that inits on first boot (idempotent)
  # then execs the daemon — repo under the writable /tmp, content gateway on
  # 0.0.0.0:8080, RPC API left on its 127.0.0.1 default for safety.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.kubo ];
    text = builtins.readFile ./docker-entrypoint.sh;
  };
in
mkImage {
  drv = pkgs.kubo;
  name = "kubo";
  tag = "v${pkgs.kubo.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert entrypoint ];

  labels = {
    "org.opencontainers.image.title" = "Kubo (IPFS)";
    "org.opencontainers.image.description" = "Go implementation of IPFS";
    "org.opencontainers.image.version" = pkgs.kubo.version;
  };
}
