{ mkImage, pkgs, lib, ... }:

# asoctl - CLI for Azure Service Operator
# https://github.com/Azure/azure-service-operator

let
  version = "2.20.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "asoctl";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Azure/azure-service-operator/releases/download/v${version}/asoctl-linux-amd64.gz";
      hash = "sha256-u2SxKYboX/q9uCS+HQRSq4C3cEGzQLXOjEOe1A4w6vQ=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      gunzip -c $src > asoctl
      install -Dm755 asoctl $out/bin/asoctl
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "azure-service-operator";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/asoctl" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "azure-service-operator";
    "org.opencontainers.image.description" = "asoctl CLI for Azure Service Operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
