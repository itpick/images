{ mkImage, pkgs, lib, ... }:

# Azure Service Operator - asoctl CLI
# https://github.com/Azure/azure-service-operator
# Note: upstream prebuilt binary; FIPS compliance is not claimed.

let
  version = "2.20.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "azure-service-operator-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Azure/azure-service-operator/releases/download/v${version}/asoctl-linux-amd64.gz";
      hash = "sha256:1x7a607d97j3ik7bah5k85qbg05ba821vgi4p2yzlpz8hqlv2r5v";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.gzip ];
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
  name = "azure-service-operator-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/asoctl" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "azure-service-operator-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
