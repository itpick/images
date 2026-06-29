{ mkImage, pkgs, lib, ... }:

# BellSoft Liberica JRE (runtime only, OpenJDK build) - LTS 21
# https://bell-sw.com/libericajdk/

let
  version = "21.0.11";
  build = "11";
  fullVersion = "${version}+${build}";

  drv = pkgs.stdenv.mkDerivation {
    pname = "liberica-jre";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/bell-sw/Liberica/releases/download/${fullVersion}/bellsoft-jre${fullVersion}-linux-amd64.tar.gz";
      hash = "sha256:0k1dyxninnpqm1f2a788bf0n2ayhhxgyr11wldkzcjn91kbiy93d";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      alsa-lib
      fontconfig.lib
      freetype
      cups.lib
      xorg.libX11
      xorg.libXext
      xorg.libXi
      xorg.libXrender
      xorg.libXtst
    ];

    sourceRoot = ".";

    dontStrip = true;
    autoPatchelfIgnoreMissingDeps = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r */. $out/
      runHook postInstall
    '';

    meta = with lib; {
      description = "BellSoft Liberica JRE - certified OpenJDK runtime (LTS 21)";
      homepage = "https://bell-sw.com/libericajdk/";
      license = licenses.gpl2Classpath;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "liberica-jre";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "liberica-jre";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
