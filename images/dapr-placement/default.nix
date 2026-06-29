{ mkImage, pkgs, lib, ... }:

# Dapr placement service
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  placement = pkgs.stdenv.mkDerivation rec {
    pname = "dapr-placement";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/placement_linux_amd64.tar.gz";
      hash = "sha256-TQXiKRaej1vDNKQE4Avvpv2ESlPb1ElOeM2Jfj1qVLo=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 placement $out/bin/placement
      runHook postInstall
    '';

    meta = with lib; {
      description = "Dapr placement service";
      homepage = "https://github.com/dapr/dapr";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = placement;
  name = "dapr-placement";
  tag = "v${version}";
  entrypoint = [ "${placement}/bin/placement" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dapr-placement";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
