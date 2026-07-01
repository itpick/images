{ mkImage, pkgs, lib, ... }:

# MongoDB for sharded clusters (iamguarded variant of upstream MongoDB) -
# upstream prebuilt Linux x86_64 binaries. Ships both mongod and mongos so the
# image can act as a shard/config server (mongod) or query router (mongos).
# https://www.mongodb.com/try/download/community

let
  version = "8.0.26";
  subdir = "mongodb-linux-x86_64-ubuntu2204-${version}";

  drv = pkgs.stdenv.mkDerivation {
    pname = "mongodb-sharded";
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
      install -Dm755 bin/mongos $out/bin/mongos
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "MongoDB server and router for sharded clusters";
      homepage = "https://www.mongodb.com";
      license = licenses.sspl;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "mongodb-sharded-nixchart";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/mongos" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mongodb-sharded-nixchart";
    "org.opencontainers.image.description" = "MongoDB server and router for sharded clusters";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
