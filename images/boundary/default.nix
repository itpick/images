{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for boundary:
# Packages available in nixpkgs:
#   pkgs.boundary  # Enables identity-based access management for dynamic infrastructure

mkImage {
  drv = pkgs.boundary;
  name = "boundary";
  tag = "v${pkgs.boundary.version}";
  entrypoint = [ "${pkgs.boundary}/bin/boundary" ];
  cmd = [ "server" "-config=/boundary/config.hcl" ];

  labels = {
    "org.opencontainers.image.title" = "Boundary";
    "org.opencontainers.image.description" = "Enables identity-based access management for dynamic infrastructure";
    "org.opencontainers.image.version" = pkgs.boundary.version;
    "io.nix-containers.chart" = "boundary";
  };
}
