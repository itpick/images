{ mkImage, pkgs, lib, ... }:

# kibana-nixchart
# ===============
# Kibana bundles its own Node.js runtime in the tarball, so we fetch
# the upstream artifact and autoPatchelf its native deps. Paired with
# charts/kibana, which points at ghcr.io/nix-containers/kibana-nixchart.

let
  version = "7.17.27";

  src = pkgs.fetchurl {
    url = "https://artifacts.elastic.co/downloads/kibana/kibana-${version}-linux-x86_64.tar.gz";
    hash = "sha256-Apj7S+EH+wL5/cjBS5x30Y7mBXke+PWrkmYBjYlvZCM=";
  };

  kibana = pkgs.stdenv.mkDerivation {
    pname = "kibana";
    inherit version src;
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
      pkgs.libxcrypt-legacy  # node 14/16 legacy libcrypt
    ];
    dontConfigure = true;
    dontBuild = true;
    # Kibana ships some Chromium bits under node_modules/@kbn/screenshotting/;
    # skip patching those broken shared objects — they aren't used at boot.
    autoPatchelfIgnoreMissingDeps = true;
    installPhase = ''
      mkdir -p $out/opt/kibana
      cp -r . $out/opt/kibana/
    '';
  };

  entrypoint = pkgs.writeShellScript "kibana-entrypoint" ''
    set -e
    # Chart passes settings via KIBANA_* env; kibana honors ELASTICSEARCH_HOSTS
    # directly. server.host must be 0.0.0.0 for container listen.
    export SERVER_HOST="''${SERVER_HOST:-0.0.0.0}"
    exec /opt/kibana/bin/kibana --allow-root "$@"
  '';

in
mkImage {
  drv = pkgs.buildEnv {
    name = "kibana-nixchart-env";
    paths = [
      kibana
      pkgs.bash
      pkgs.coreutils
      pkgs.cacert
      pkgs.gnutar
      pkgs.gzip
    ];
  };

  name = "kibana-nixchart";
  tag = "v${version}";

  entrypoint = [ "${entrypoint}" ];
  cmd = [];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "kibana-nixchart";
    "org.opencontainers.image.description" = "Kibana ${version} for use with charts/kibana";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kibana";
  };
}
