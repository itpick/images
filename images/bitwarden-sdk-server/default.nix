# bitwarden-sdk-server
# =============
# Bitwarden SDK Server - Server component for Bitwarden SDK
# https://github.com/bitwarden/sdk
#
# The Bitwarden SDK provides APIs for interacting with Bitwarden services.
# This is a Rust-based application.
#
# NOTE: Bitwarden SDK is primarily a library. The "server" component
# may refer to a self-hosted secrets manager API.
# Binary releases are not publicly available; this builds from source.

{ mkImage, fetchFromGitHub, rustPlatform, pkgs, lib, ... }:

let
  version = "1.0.0";
  bitwarden-sdk-server = rustPlatform.buildRustPackage {
    pname = "bitwarden-sdk-server";
    inherit version;

    src = fetchFromGitHub {
      owner = "bitwarden";
      repo = "sdk";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    nativeBuildInputs = with pkgs; [
      pkg-config
    ];

    buildInputs = with pkgs; [
      openssl
    ];

    doCheck = false;

    meta = with lib; {
      description = "Bitwarden SDK Server";
      homepage = "https://github.com/bitwarden/sdk";
      license = licenses.gpl3;
    };
  };

in
mkImage {
  drv = bitwarden-sdk-server;
  name = "bitwarden-sdk-server";
  tag = "v${version}";
  entrypoint = [ "${bitwarden-sdk-server}/bin/bitwarden-sdk-server" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Bitwarden SDK Server";
    "org.opencontainers.image.description" = "Server component for Bitwarden SDK";
    "org.opencontainers.image.version" = version;
  };
}
