{ mkImage, pkgs, lib, ... }:

# Apache ActiveMQ Artemis - high-performance, multi-protocol message broker
# https://activemq.apache.org/components/artemis/
# Upstream ships an official prebuilt "-bin" distribution (JVM app + native libs);
# run the launcher with a JRE on PATH.

let
  version = "2.44.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apache-activemq-artemis";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/activemq/activemq-artemis/${version}/apache-artemis-${version}-bin.tar.gz";
      hash = "sha256:0a9y3qfrch3k1733ndkspjxgfg7g2bphnxfdc5ikgxhsil534c0h";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "apache-artemis-${version}";

    dontStrip = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/artemis
      cp -r . $out/artemis/
      mkdir -p $out/bin
      ln -s $out/artemis/bin/artemis $out/bin/artemis
      ln -s $out/artemis/bin/artemis-service $out/bin/artemis-service
      runHook postInstall
    '';

    meta = with lib; {
      description = "Apache ActiveMQ Artemis message broker";
      homepage = "https://activemq.apache.org/components/artemis/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "apache-activemq-artemis";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/artemis" ];
  cmd = [ "help" ];

  extraPkgs = [ pkgs.jre ];

  labels = {
    "org.opencontainers.image.title" = "apache-activemq-artemis";
    "org.opencontainers.image.description" = "Apache ActiveMQ Artemis message broker";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
