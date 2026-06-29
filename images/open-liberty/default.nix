{ mkImage, pkgs, lib, ... }:

# Open Liberty - lightweight open Java EE / Jakarta EE application server
# https://github.com/OpenLiberty/open-liberty
# Official runtime zip distributed via Maven Central.

let
  version = "26.0.0.6";

  drv = pkgs.stdenv.mkDerivation {
    pname = "open-liberty";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://repo1.maven.org/maven2/io/openliberty/openliberty-runtime/${version}/openliberty-runtime-${version}.zip";
      sha256 = "1xcgf7ycj501wa6231ahf8987cknpbkzaby3hbrnm6jpi1qqkgp6";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r wlp $out/wlp
      mkdir -p $out/bin
      ln -s $out/wlp/bin/server $out/bin/server
      runHook postInstall
    '';

    dontStrip = true;
  };
in mkImage {
  inherit drv;
  name = "open-liberty";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/server" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [
    jdk17_headless
    bash
  ];

  labels = {
    "org.opencontainers.image.title" = "open-liberty";
    "org.opencontainers.image.description" = "Open Liberty Java application server runtime";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
