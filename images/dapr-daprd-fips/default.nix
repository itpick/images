{ mkImage, pkgs, lib, ... }:

# dapr-daprd-fips - Dapr sidecar runtime (daprd).
# Packages the upstream Dapr daprd binary. No FIPS claim is made here.
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "daprd";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/daprd_linux_amd64.tar.gz";
      hash = "sha256:0l4cka724jxpar2fjrrlkhfvmwmni4ilmkrzshbxqyksb85c08yh";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";
    dontStrip = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 daprd $out/bin/daprd
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "dapr-daprd-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/daprd" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dapr-daprd-fips";
    "org.opencontainers.image.description" = "Dapr sidecar runtime (daprd)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
