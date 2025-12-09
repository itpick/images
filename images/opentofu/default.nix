{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for opentofu:
# Packages available in nixpkgs:
#   pkgs.opentofu  # Tool for building, changing, and versioning infrastructure

mkImage {
  drv = pkgs.opentofu;
  name = "opentofu";
  tag = "v${pkgs.opentofu.version}";
  entrypoint = [ "${pkgs.opentofu}/bin/tofu" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ git cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenTofu";
    "org.opencontainers.image.description" = "Open-source tool for building, changing, and versioning infrastructure";
    "org.opencontainers.image.version" = pkgs.opentofu.version;
    "io.nix-containers.chart" = "opentofu";
  };
}
