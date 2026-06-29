{ mkImage, pkgs, lib, ... }:

# Apache Hop - data orchestration and data engineering platform
# https://hop.apache.org/
# Upstream ships an official prebuilt "client" zip (JVM app); run the launcher
# scripts with a JRE on PATH.

let
  version = "2.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apache-hop";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://archive.apache.org/dist/hop/${version}/apache-hop-client-${version}.zip";
      hash = "sha256:1qdkshqz9scxl88syvkh0d179skfq7skh6mpjxj4ka4ilb60wnrj";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];

    sourceRoot = "hop";

    dontStrip = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/hop
      cp -r . $out/hop/
      chmod +x $out/hop/*.sh
      mkdir -p $out/bin
      for s in hop-run hop-conf hop-server hop-gui hop-encrypt hop-import hop-search; do
        ln -s $out/hop/$s.sh $out/bin/$s
      done
      runHook postInstall
    '';

    meta = with lib; {
      description = "Apache Hop data orchestration and data engineering platform";
      homepage = "https://hop.apache.org/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "apache-hop";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/hop-run" ];
  cmd = [ "--help" ];

  extraPkgs = [ pkgs.jre ];

  labels = {
    "org.opencontainers.image.title" = "apache-hop";
    "org.opencontainers.image.description" = "Apache Hop data orchestration and data engineering platform";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
