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
  # Was empty (no command). Run the HTTP API server: bind 0.0.0.0:8888 so the
  # kind-test probe can reach it. -ca/-ca-key/-config are optional — without
  # them cfssl logs "couldn't initialize signer" and disables the signing
  # endpoints but the server still starts and stays up. Operators mount a CA
  # (-ca/-ca-key) + signing -config for real certificate issuance.
  cmd = [ "serve" "-address=0.0.0.0" "-port=8888" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "CFSSL";
    "org.opencontainers.image.description" = "Cloudflare's PKI and TLS toolkit";
    "org.opencontainers.image.version" = pkgs.cfssl.version;
  };
}
