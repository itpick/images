{ mkImage, pkgs, lib, ... }:

# Temporal schema setup tooling - SQL and Cassandra schema management binaries
# https://github.com/temporalio/temporal
let
  version = "1.31.1";
  drv = pkgs.stdenv.mkDerivation {
    pname = "temporal-server-schema";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/temporalio/temporal/releases/download/v${version}/temporal_${version}_linux_amd64.tar.gz";
      hash = "sha256:0qxsyxkmpjrm9msfw0ahlv6jbhzpblv9hmsrivjc8iihg2lbws3d";
    };
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = ".";
    installPhase = ''
      runHook preInstall
      install -Dm755 temporal-sql-tool $out/bin/temporal-sql-tool
      install -Dm755 temporal-cassandra-tool $out/bin/temporal-cassandra-tool
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "temporal-server-schema";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/temporal-sql-tool" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "temporal-server-schema";
    "org.opencontainers.image.description" = "Temporal database schema setup tooling";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
