{ mkImage, pkgs, lib, ... }:

# datadog-agent-fips
# Container image packaging nixpkgs.datadog-agent
mkImage {
  drv = pkgs.datadog-agent;
  name = "datadog-agent-fips";
  tag = "v${pkgs.datadog-agent.version}";
  entrypoint = [ (lib.getExe pkgs.datadog-agent) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "datadog-agent-fips";
    "org.opencontainers.image.description" = "datadog-agent-fips container image (nixpkgs.datadog-agent)";
    "org.opencontainers.image.version" = pkgs.datadog-agent.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
