{ mkImage, pkgs, lib, ... }:

# InfluxDB 2.x server daemon (influxd) - https://github.com/influxdata/influxdb
# Upstream prebuilt linux/amd64 server tarball from dl.influxdata.com.

let
  version = "2.7.11";

  drv = pkgs.stdenv.mkDerivation {
    pname = "influxd";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://dl.influxdata.com/influxdb/releases/influxdb2-${version}_linux_amd64.tar.gz";
      hash = "sha256-jXhyATytNST7coyoSD0K3DASWtGvJiq4Jtz10YARWc8=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "influxdb2-${version}";

    installPhase = ''
      runHook preInstall
      install -Dm755 usr/bin/influxd $out/bin/influxd
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "influxd";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/influxd" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "influxd";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
