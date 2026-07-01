{ mkImage, pkgs, lib, ... }:

# mongodb-nixchart
# ================
# MongoDB Community Server via upstream prebuilt binary — avoids the
# multi-hour source build of pkgs.mongodb.

let
  version = "8.0.26";
  subdir = "mongodb-linux-x86_64-ubuntu2204-${version}";

  drv = pkgs.stdenv.mkDerivation {
    pname = "mongodb-nixchart";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://fastdl.mongodb.org/linux/${subdir}.tgz";
      hash = "sha256-8zkInMowUE4HopP+dmz/ev4Zw3C99NbeWPIWWv/AXUY=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      openssl
      curl
      zlib
    ];

    sourceRoot = subdir;

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/mongod $out/bin/mongod
      install -Dm755 bin/mongosh $out/bin/mongosh || true
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "MongoDB Community Server";
      homepage = "https://www.mongodb.com";
      license = licenses.sspl;
      platforms = [ "x86_64-linux" ];
    };
  };

  entrypoint = pkgs.writeShellScript "mongodb-entrypoint" ''
    set -euo pipefail
    DATA_DIR="''${MONGODB_DATA_DIR:-/data/db}"
    PORT="''${MONGODB_PORT_NUMBER:-27017}"
    BIND_IP="''${MONGODB_BIND_IP:-0.0.0.0}"
    mkdir -p "$DATA_DIR"

    if [ -z "$(ls -A "$DATA_DIR" 2>/dev/null)" ]; then
      if [ -z "''${MONGODB_ROOT_PASSWORD:-}" ] && [ "''${MONGODB_ALLOW_EMPTY_PASSWORD:-no}" != "yes" ]; then
        echo "mongodb-nixchart: MONGODB_ROOT_PASSWORD is required (or set MONGODB_ALLOW_EMPTY_PASSWORD=yes)" >&2
        exit 1
      fi
      : # First-run bootstrap; auth setup requires the mongosh client which
        # nixpkgs' prebuilt does not always ship. Users can seed via
        # /docker-entrypoint-initdb.d/ scripts run externally.
    fi

    exec ${drv}/bin/mongod \
      --dbpath "$DATA_DIR" \
      --port "$PORT" \
      --bind_ip "$BIND_IP" \
      ''${MONGODB_ROOT_PASSWORD:+--auth} \
      ''${MONGODB_EXTRA_FLAGS:-} \
      "$@"
  '';

in mkImage {
  inherit drv;
  name = "mongodb-nixchart";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "mongodb-nixchart";
    "org.opencontainers.image.description" = "MongoDB tuned for the nix-containers charts/mongodb chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "mongodb";
  };
}
