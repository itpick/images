{ mkImage, pkgs, lib, ... }:

# tflint-fips
# Container image packaging nixpkgs.tflint
mkImage {
  drv = pkgs.tflint;
  name = "tflint-fips";
  tag = "v${pkgs.tflint.version}";
  entrypoint = [ (lib.getExe pkgs.tflint) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tflint-fips";
    "org.opencontainers.image.description" = "tflint-fips container image (nixpkgs.tflint)";
    "org.opencontainers.image.version" = pkgs.tflint.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
