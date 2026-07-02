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
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the server:
  # influxd binds the HTTP API on 0.0.0.0:8086 by default. Its bolt/engine/sqlite
  # stores default to $HOME/.influxdbv2, but influxd resolves the home from the
  # passwd entry (not $HOME), which is read-only here — so point them explicitly
  # at the writable /tmp mkImage provides (influxd creates the dirs). Operators
  # mount a PVC and override these paths.
  cmd = [
    "--bolt-path=/tmp/influxdb/influxd.bolt"
    "--engine-path=/tmp/influxdb/engine"
    "--sqlite-path=/tmp/influxdb/influxd.sqlite"
  ];

  labels = {
    "org.opencontainers.image.title" = "influxd";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
