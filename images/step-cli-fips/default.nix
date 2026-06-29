{ mkImage, pkgs, lib, ... }:

# step-cli-fips
# Container image packaging nixpkgs.step-cli
mkImage {
  drv = pkgs.step-cli;
  name = "step-cli-fips";
  tag = "v${pkgs.step-cli.version}";
  entrypoint = [ (lib.getExe pkgs.step-cli) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "step-cli-fips";
    "org.opencontainers.image.description" = "step-cli-fips container image (nixpkgs.step-cli)";
    "org.opencontainers.image.version" = pkgs.step-cli.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
