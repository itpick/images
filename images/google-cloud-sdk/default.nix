{ mkImage, pkgs, lib, ... }:

# Google Cloud SDK - CLI for Google Cloud Platform
# https://cloud.google.com/sdk

mkImage {
  drv = pkgs.google-cloud-sdk;
  name = "google-cloud-sdk";
  tag = "v${pkgs.google-cloud-sdk.version}";
  entrypoint = [ "${pkgs.google-cloud-sdk}/bin/gcloud" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Google Cloud SDK";
    "org.opencontainers.image.description" = "Command-line interface for Google Cloud Platform";
    "org.opencontainers.image.version" = pkgs.google-cloud-sdk.version;
  };
}
