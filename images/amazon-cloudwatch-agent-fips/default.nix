{ mkImage, pkgs, lib, ... }:

# amazon-cloudwatch-agent-fips
# Container image packaging nixpkgs.amazon-cloudwatch-agent
mkImage {
  drv = pkgs.amazon-cloudwatch-agent;
  name = "amazon-cloudwatch-agent-fips";
  tag = "v${pkgs.amazon-cloudwatch-agent.version}";
  entrypoint = [ (lib.getExe pkgs.amazon-cloudwatch-agent) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "amazon-cloudwatch-agent-fips";
    "org.opencontainers.image.description" = "amazon-cloudwatch-agent-fips container image (nixpkgs.amazon-cloudwatch-agent)";
    "org.opencontainers.image.version" = pkgs.amazon-cloudwatch-agent.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
