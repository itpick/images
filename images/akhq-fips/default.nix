{ mkImage, pkgs, lib, ... }:

# AKHQ - GUI to manage & monitor Apache Kafka (topics, consumers, schema registry, ...)
# https://github.com/tchiotludo/akhq
# Upstream ships a platform-independent "-all" fat JAR; run it with a JRE.
# Note: the "-fips" image name refers to the same upstream AKHQ tool.

let
  version = "0.27.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "akhq";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/tchiotludo/akhq/releases/download/${version}/akhq-${version}-all.jar";
      hash = "sha256:1b1ca2zi9s3n3fvi2ii019sv49arn8lg1g9jmw0v947x9iwzv7y8";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.makeWrapper ];

    dontUnpack = true;
    dontStrip = true;

    installPhase = ''
      runHook preInstall
      install -Dm644 $src $out/share/akhq/akhq.jar
      makeWrapper ${pkgs.jre}/bin/java $out/bin/akhq \
        --add-flags "-jar $out/share/akhq/akhq.jar"
      runHook postInstall
    '';

    meta = with lib; {
      description = "GUI to manage and monitor Apache Kafka";
      homepage = "https://github.com/tchiotludo/akhq";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "akhq-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/akhq" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "akhq-fips";
    "org.opencontainers.image.description" = "GUI to manage and monitor Apache Kafka";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
