{ mkImage, pkgs, lib, ... }:

# BellSoft Liberica JDK (full JDK, OpenJDK build) - LTS 21
# Packaged from the upstream Liberica JDK binary. The "-fips" image name is an
# upstream/downstream variant tag; no FIPS compliance is claimed here.
# https://bell-sw.com/libericajdk/

let
  version = "21.0.11";
  build = "11";
  fullVersion = "${version}+${build}";

  drv = pkgs.stdenv.mkDerivation {
    pname = "liberica-jdk-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/bell-sw/Liberica/releases/download/${fullVersion}/bellsoft-jdk${fullVersion}-linux-amd64.tar.gz";
      hash = "sha256:0arx5dlg0swrsrijzfl7b9dmihglqqx3jh5gsqbmxss6529cxnr2";
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
      description = "BellSoft Liberica JDK - certified OpenJDK build (LTS 21)";
      homepage = "https://bell-sw.com/libericajdk/";
      license = licenses.gpl2Classpath;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "liberica-jdk-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/java" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "liberica-jdk-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
