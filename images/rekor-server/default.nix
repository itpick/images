# rekor-server
# =============
# Rekor - Sigstore transparency log
# https://github.com/sigstore/rekor
#
# Rekor provides an immutable tamper-resistant ledger of metadata
# for software artifacts.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.rekor;
  name = "rekor-server";
  tag = "v${pkgs.rekor.version}";
  entrypoint = [ "${pkgs.rekor}/bin/rekor-server" ];
  cmd = [ "serve" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Rekor Server";
    "org.opencontainers.image.description" = "Sigstore transparency log for software supply chain";
    "org.opencontainers.image.version" = pkgs.rekor.version;
  };
}
