{ mkImage, pkgs, lib, ... }:

# tesseract-fips
# Container image packaging nixpkgs.tesseract
mkImage {
  drv = pkgs.tesseract;
  name = "tesseract-fips";
  tag = "v${pkgs.tesseract.version}";
  entrypoint = [ (lib.getExe pkgs.tesseract) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tesseract-fips";
    "org.opencontainers.image.description" = "tesseract-fips container image (nixpkgs.tesseract)";
    "org.opencontainers.image.version" = pkgs.tesseract.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
