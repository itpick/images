{ mkImage, pkgs, lib, ... }:

# Apache Tika - content analysis / detection & extraction toolkit
# https://tika.apache.org  (tika-server standard distribution)
# Upstream prebuilt binary distribution: tika-server-standard-<ver>-bin.tgz

let
  version = "3.3.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apache-tika-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/tika/${version}/tika-server-standard-${version}-bin.tgz";
      hash = "sha256-yteqiB3CWBe2DIbWjePTio5pj2w9Y8ztw3ZPhceXjUk=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.makeWrapper ];

    sourceRoot = "tika-server-standard-${version}-bin";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/tika
      cp tika-server.jar $out/share/tika/tika-server.jar
      makeWrapper ${pkgs.jdk17_headless}/bin/java $out/bin/tika-server \
        --add-flags "-jar $out/share/tika/tika-server.jar"
      runHook postInstall
    '';

    meta = with lib; {
      description = "Apache Tika Server - content detection and extraction";
      homepage = "https://tika.apache.org";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "apache-tika";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/tika-server" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "apache-tika";
    "org.opencontainers.image.description" = "Apache Tika Server content extraction toolkit";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
