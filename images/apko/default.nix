{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for apko:
# Packages available in nixpkgs:
#   pkgs.apko  # Build OCI images using APK directly without Dockerfile

mkImage {
  drv = pkgs.apko;
  name = "apko";
  tag = "v${pkgs.apko.version}";
  entrypoint = [ "${pkgs.apko}/bin/apko" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "apko";
    "org.opencontainers.image.description" = "Build OCI images using APK directly without Dockerfile";
    "org.opencontainers.image.version" = pkgs.apko.version;
    "io.nix-containers.chart" = "apko";
  };
}
