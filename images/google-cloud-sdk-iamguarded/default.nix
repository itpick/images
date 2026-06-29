{ mkImage, pkgs, lib, ... }:

# google-cloud-sdk-iamguarded
# Container image packaging nixpkgs.google-cloud-sdk
mkImage {
  drv = pkgs.google-cloud-sdk;
  name = "google-cloud-sdk-iamguarded";
  tag = "v${pkgs.google-cloud-sdk.version}";
  entrypoint = [ (lib.getExe pkgs.google-cloud-sdk) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "google-cloud-sdk-iamguarded";
    "org.opencontainers.image.description" = "google-cloud-sdk-iamguarded container image (nixpkgs.google-cloud-sdk)";
    "org.opencontainers.image.version" = pkgs.google-cloud-sdk.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
