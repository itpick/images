{ mkImage, pkgs, lib, ... }:

# JDK with CRaC (Coordinated Restore at Checkpoint).
# Prebuilt OpenJDK CRaC linux-x64 binary release.
# https://github.com/CRaC/openjdk-builds

let
  version = "24-crac+20";

  drv = pkgs.stdenv.mkDerivation {
    pname = "jdk-crac";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/CRaC/openjdk-builds/releases/download/24-crac%2B20/openjdk-24-crac%2B20_linux-x64.tar.gz";
      hash = "sha256-ojMRJBtBKIBUwEWAiY/BZmpzBoO3GUbUVpAl96m8WTU=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      alsa-lib
      freetype
      fontconfig
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXtst
      xorg.libXi
      cups
    ];

    sourceRoot = "openjdk-24-crac+20_linux-x64";

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r . $out/
      runHook postInstall
    '';

    dontStrip = true;
  };

in mkImage {
  inherit drv;
  name = "jdk-crac";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "jdk-crac";
    "org.opencontainers.image.description" = "OpenJDK with CRaC (Coordinated Restore at Checkpoint)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
