{ mkImage, pkgs, lib, ... }:

# GraalVM Community Edition 25 (CE) - high-performance JDK 25
# https://github.com/graalvm/graalvm-ce-builds
let
  version = "25.0.2";
  drv = pkgs.stdenv.mkDerivation {
    pname = "graalvm-25-ce";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${version}/graalvm-community-jdk-${version}_linux-x64_bin.tar.gz";
      hash = "sha256-4L55HI/aTQO2sKDLgk/vMUlzYXAFezpRUlK0RBlgavA=";
    };
    sourceRoot = "graalvm-community-openjdk-25.0.2+10.1";
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      alsa-lib
      fontconfig
      freetype
      xorg.libX11
      xorg.libXext
      xorg.libXi
      xorg.libXrender
      xorg.libXtst
    ];
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
  name = "graalvm-25-ce";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/java" ];
  cmd = [ "--version" ];
  labels = {
    "org.opencontainers.image.title" = "graalvm-25-ce";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
