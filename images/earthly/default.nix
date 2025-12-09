{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for earthly:
# Packages available in nixpkgs:
#   pkgs.earthly  # Build automation for the container era

mkImage {
  drv = pkgs.earthly;
  name = "earthly";
  tag = "v${pkgs.earthly.version}";
  entrypoint = [ "${pkgs.earthly}/bin/earthly" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ git ];

  labels = {
    "org.opencontainers.image.title" = "Earthly";
    "org.opencontainers.image.description" = "Build automation for the container era";
    "org.opencontainers.image.version" = pkgs.earthly.version;
    "io.nix-containers.chart" = "earthly";
  };
}
