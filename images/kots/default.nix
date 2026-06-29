{ mkImage, pkgs, lib, ... }:

# KOTS - Replicated kots CLI / kubectl plugin
# https://github.com/replicatedhq/kots

let
  version = "1.130.6";

  drv = pkgs.stdenv.mkDerivation {
    pname = "kots";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/replicatedhq/kots/releases/download/v${version}/kots_linux_amd64.tar.gz";
      hash = "sha256-+HnSbfMuoJ7UBG2IoGZAk2RskfjWNZ3vq8Oz+cimxWs=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 kots $out/bin/kots
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "kots";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kots" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "kots";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
