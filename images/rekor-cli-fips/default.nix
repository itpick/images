{ mkImage, pkgs, lib, ... }:

# rekor-cli-fips
# Container image packaging nixpkgs.rekor-cli
mkImage {
  drv = pkgs.rekor-cli;
  name = "rekor-cli-fips";
  tag = "v${pkgs.rekor-cli.version}";
  entrypoint = [ (lib.getExe pkgs.rekor-cli) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rekor-cli-fips";
    "org.opencontainers.image.description" = "rekor-cli-fips container image (nixpkgs.rekor-cli)";
    "org.opencontainers.image.version" = pkgs.rekor-cli.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
