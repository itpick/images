# cfssl
# =============
# CFSSL - Cloudflare's PKI and TLS toolkit
# https://github.com/cloudflare/cfssl
#
# CFSSL is a toolkit for certificate management, including signing,
# verification, and bundling of TLS certificates.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.cfssl;
  name = "cfssl";
  tag = "v${pkgs.cfssl.version}";
  entrypoint = [ "${pkgs.cfssl}/bin/cfssl" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "CFSSL";
    "org.opencontainers.image.description" = "Cloudflare's PKI and TLS toolkit";
    "org.opencontainers.image.version" = pkgs.cfssl.version;
  };
}
