{ mkImage, pkgs, lib, ... }:

# InfluxDB CLI (influx) - https://github.com/influxdata/influx-cli
# Upstream prebuilt linux/amd64 client tarball from dl.influxdata.com.

let
  version = "2.8.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "influx";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://dl.influxdata.com/influxdb/releases/influxdb2-client-${version}-linux-amd64.tar.gz";
      hash = "sha256-/qoy4CyZgVQUV0Jl1UccTyVQsHrvb4sZkH2KGvmOXWE=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 influx $out/bin/influx
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "influx";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/influx" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "influx";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
