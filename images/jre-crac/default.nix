{ mkImage, pkgs, lib, ... }:

# Azul Zulu JRE with CRaC (Coordinated Restore at Checkpoint) support
# https://www.azul.com/products/components/crac/
# Prebuilt linux x86_64 binary release from Azul.

let
  version = "21.0.11";
  zuluVersion = "zulu21.50.19-ca-crac-jre21.0.11-linux_x64";

  drv = pkgs.stdenv.mkDerivation {
    pname = "jre-crac";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://cdn.azul.com/zulu/bin/${zuluVersion}.tar.gz";
      hash = "sha256-CWsFxbtyQoVivv2PxNhkbY1RVbejdbB1WYa4xrAmUws=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      freetype
      fontconfig
      alsa-lib
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXtst
      xorg.libXi
    ];

    sourceRoot = zuluVersion;

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r . $out/jre
      mkdir -p $out/bin
      for b in $out/jre/bin/*; do
        ln -s "$b" "$out/bin/$(basename "$b")"
      done
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "Azul Zulu JRE with CRaC support";
      homepage = "https://www.azul.com/products/components/crac/";
      license = licenses.gpl2Only;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "jre-crac";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/java" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "jre-crac";
    "org.opencontainers.image.description" = "Azul Zulu JRE with CRaC (Coordinated Restore at Checkpoint)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
