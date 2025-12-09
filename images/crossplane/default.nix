{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for crossplane:
# Packages available in nixpkgs:
#   pkgs.crossplane  # crossplane-2.1 (2.1.3-r1)

mkImage {
  drv = pkgs.crossplane-cli;
  name = "crossplane";
  tag = "v${pkgs.crossplane-cli.version}";
  entrypoint = [ "${pkgs.crossplane-cli}/bin/crossplane" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Crossplane";
    "org.opencontainers.image.description" = "Cloud Native Control Plane";
    "org.opencontainers.image.version" = pkgs.crossplane-cli.version;
    "io.nix-containers.chart" = "crossplane";
  };
}
