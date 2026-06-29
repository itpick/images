{ mkImage, pkgs, lib, ... }:

# Apache Kafka - distributed event streaming platform
# https://kafka.apache.org
# (iamguarded variant packages the upstream Apache Kafka release binary)

let
  version = "3.9.0";
  scalaVersion = "2.13";

  drv = pkgs.stdenv.mkDerivation {
    pname = "kafka-iamguarded";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/kafka/${version}/kafka_${scalaVersion}-${version}.tgz";
      hash = "sha256-q8REAt3xA+OPGbDktE5l2pqDG6nlj9dyUEGxqhaO6NE=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    sourceRoot = "kafka_${scalaVersion}-${version}";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/opt/kafka $out/bin
      cp -r . $out/opt/kafka/
      for f in $out/opt/kafka/bin/*.sh; do
        chmod +x "$f"
        ln -s "$f" "$out/bin/$(basename "$f")"
      done
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "Apache Kafka distributed event streaming platform";
      homepage = "https://kafka.apache.org";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "kafka-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kafka-server-start.sh" ];
  cmd = [ ];

  extraPkgs = [ pkgs.jre pkgs.bash ];

  labels = {
    "org.opencontainers.image.title" = "kafka-iamguarded";
    "org.opencontainers.image.description" = "Apache Kafka distributed event streaming platform";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
