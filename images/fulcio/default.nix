# fulcio
# =============
# Fulcio - Sigstore OIDC PKI
# https://github.com/sigstore/fulcio
#
# Fulcio is a free-to-use certificate authority for issuing code signing
# certificates for an OpenID Connect (OIDC) identity.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.fulcio;
  name = "fulcio";
  tag = "v${pkgs.fulcio.version}";
  entrypoint = [ "${pkgs.fulcio}/bin/fulcio" ];
  cmd = [ "serve" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Fulcio";
    "org.opencontainers.image.description" = "Sigstore OIDC PKI for code signing certificates";
    "org.opencontainers.image.version" = pkgs.fulcio.version;
  };
}
