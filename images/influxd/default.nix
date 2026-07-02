{ mkImage, pkgs, lib, ... }:

# InfluxDB 2.x server daemon (influxd) - https://github.com/influxdata/influxdb
# Upstream prebuilt linux/amd64 server tarball from dl.influxdata.com.

let
  # 2.7.11 → 2.7.12 clears 2 critical Go stdlib CVEs (stdlib v1.22.7 was
  # missing rebuild fixes). Stays within the 2.7.x line so no API/config
  # changes for consumers.
  version = "2.7.12";

  drv = pkgs.stdenv.mkDerivation {
    pname = "influxd";
    inherit version;

    src = pkgs.fetchurl {
      # Upstream moved the layout from /releases/<file> to
      # /releases/v<ver>/<file> starting with 2.7.12.
      url = "https://dl.influxdata.com/influxdb/releases/v${version}/influxdb2-${version}_linux_amd64.tar.gz";
      hash = "sha256-glZB5ni0oPbiCUKT8ya0ciafMMPQKpib7ow3v6cG+Nc=";
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
