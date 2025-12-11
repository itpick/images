{ mkImage, pkgs, lib, ... }:

# SPIRE Agent - SPIFFE Runtime Environment Agent
# https://spiffe.io/

mkImage {
  drv = pkgs.spire-agent;
  name = "spire-agent";
  tag = "v${pkgs.spire-agent.version}";
  entrypoint = [ "${pkgs.spire-agent}/bin/spire-agent" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "SPIRE Agent";
    "org.opencontainers.image.description" = "SPIFFE Runtime Environment Agent for workload identity";
    "org.opencontainers.image.version" = pkgs.spire-agent.version;
  };
}
