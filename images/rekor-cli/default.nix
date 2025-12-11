{ mkImage, pkgs, lib, ... }:

# Rekor CLI - CLI client for Sigstore transparency log
# https://github.com/sigstore/rekor

mkImage {
  drv = pkgs.rekor-cli;
  name = "rekor-cli";
  tag = "v${pkgs.rekor-cli.version}";
  entrypoint = [ "${pkgs.rekor-cli}/bin/rekor-cli" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Rekor CLI";
    "org.opencontainers.image.description" = "CLI client for Sigstore transparency log";
    "org.opencontainers.image.version" = pkgs.rekor-cli.version;
  };
}
