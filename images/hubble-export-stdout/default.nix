{ mkImage, pkgs, lib, ... }:

# Hubble CLI - observability for Cilium (used for hubble export to stdout)
# https://github.com/cilium/hubble
let
  version = "1.19.4";

  drv = pkgs.stdenv.mkDerivation {
    pname = "hubble";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cilium/hubble/releases/download/v${version}/hubble-linux-amd64.tar.gz";
      hash = "sha256:0iyjbq06zs9iq7rpmrq82n2bpsqwqvndnvaw97ay4apd4xgpmhy7";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 hubble $out/bin/hubble
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "hubble-export-stdout";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/hubble" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "hubble-export-stdout";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
