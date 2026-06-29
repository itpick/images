{ mkImage, pkgs, lib, ... }:

# Open Liberty (kernel) - minimal Open Liberty runtime kernel
# https://github.com/OpenLiberty/open-liberty
# Official kernel zip distributed via Maven Central.

let
  version = "26.0.0.6";

  drv = pkgs.stdenv.mkDerivation {
    pname = "open-liberty-kernel";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://repo1.maven.org/maven2/io/openliberty/openliberty-kernel/${version}/openliberty-kernel-${version}.zip";
      sha256 = "0sn0nah9r5y64y28skgpbxbpbyh6yav0krhsn2jvjcbjfgch5sxc";
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
  name = "open-liberty-kernel";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/server" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [
    jdk17_headless
    bash
  ];

  labels = {
    "org.opencontainers.image.title" = "open-liberty-kernel";
    "org.opencontainers.image.description" = "Open Liberty runtime kernel";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
