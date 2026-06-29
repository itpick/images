{ mkImage, pkgs, lib, ... }:

# Strimzi Kafka Bridge - HTTP/AMQP bridge for Apache Kafka
# https://github.com/strimzi/strimzi-kafka-bridge

let
  version = "1.0.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "kafka-bridge";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/strimzi/strimzi-kafka-bridge/releases/download/${version}/kafka-bridge-${version}.tar.gz";
      hash = "sha256-eOiWLUgSB4PKM7t24H6GK/IXKLY8UHiKwmsySDmVnqU=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    sourceRoot = "kafka-bridge-${version}";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/opt/kafka-bridge $out/bin
      cp -r . $out/opt/kafka-bridge/
      ln -s $out/opt/kafka-bridge/bin/kafka_bridge_run.sh $out/bin/kafka_bridge_run.sh
      chmod +x $out/opt/kafka-bridge/bin/kafka_bridge_run.sh
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "Strimzi HTTP bridge for Apache Kafka";
      homepage = "https://github.com/strimzi/strimzi-kafka-bridge";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "kafka-bridge";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kafka_bridge_run.sh" ];
  cmd = [ ];

  extraPkgs = [ pkgs.jre pkgs.bash ];

  labels = {
    "org.opencontainers.image.title" = "kafka-bridge";
    "org.opencontainers.image.description" = "Strimzi HTTP bridge for Apache Kafka";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
