{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for restic:
# Packages available in nixpkgs:
#   pkgs.restic  # Backup program that is fast, efficient and secure

mkImage {
  drv = pkgs.restic;
  name = "restic";
  tag = "v${pkgs.restic.version}";
  entrypoint = [ "${pkgs.restic}/bin/restic" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Restic";
    "org.opencontainers.image.description" = "Fast, efficient and secure backup program";
    "org.opencontainers.image.version" = pkgs.restic.version;
    "io.nix-containers.chart" = "restic";
  };
}
