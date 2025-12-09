{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for syncthing:
# Packages available in nixpkgs:
#   pkgs.syncthing  # Open Source Continuous File Synchronization

mkImage {
  drv = pkgs.syncthing;
  name = "syncthing";
  tag = "v${pkgs.syncthing.version}";
  entrypoint = [ "${pkgs.syncthing}/bin/syncthing" ];
  cmd = [ "-gui-address=0.0.0.0:8384" ];

  env = {
    HOME = "/var/syncthing";
  };

  labels = {
    "org.opencontainers.image.title" = "Syncthing";
    "org.opencontainers.image.description" = "Open Source Continuous File Synchronization";
    "org.opencontainers.image.version" = pkgs.syncthing.version;
    "io.nix-containers.chart" = "syncthing";
  };
}
