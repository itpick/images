{ mkImage, pkgs, lib, ... }:

# Spegel - stateless cluster local OCI registry mirror
# https://github.com/spegel-org/spegel
# Note: packages the upstream spegel binary (no FIPS claim made).

let
  version = "0.7.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "spegel";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/spegel-org/spegel/releases/download/v${version}/spegel_${version}_linux_amd64.tar.gz";
      hash = "sha256:0vgdffil1ql9kxakjsbqzq0cgd7ppymv3yh1vibncapi14qcssvh";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 spegel_linux_amd64/spegel $out/bin/spegel
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "spegel-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/spegel" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "spegel-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
