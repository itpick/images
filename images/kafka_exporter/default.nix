{ mkImage, pkgs, lib, ... }:

# kafka_exporter - Prometheus exporter for Apache Kafka (danielqsj/kafka_exporter)
# https://github.com/danielqsj/kafka_exporter
# Upstream prebuilt linux amd64 release tarball (pure-Go static binary).

let
  version = "1.9.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "kafka_exporter";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/danielqsj/kafka_exporter/releases/download/v${version}/kafka_exporter-${version}.linux-amd64.tar.gz";
      hash = "sha256-xyJRitccU7OYjqJq4r04e7WWznqY/GOdCL9jmlN2maE=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    sourceRoot = "kafka_exporter-${version}.linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 kafka_exporter $out/bin/kafka_exporter
      runHook postInstall
    '';

    meta = with lib; {
      description = "Kafka exporter for Prometheus";
      homepage = "https://github.com/danielqsj/kafka_exporter";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "kafka_exporter";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kafka_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kafka_exporter";
    "org.opencontainers.image.description" = "Kafka exporter for Prometheus";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
