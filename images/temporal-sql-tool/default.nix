{ mkImage, pkgs, lib, ... }:

# Temporal SQL schema/admin tool
# https://github.com/temporalio/temporal
let
  version = "1.31.1";
  drv = pkgs.stdenv.mkDerivation {
    pname = "temporal-sql-tool";
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
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "temporal-sql-tool";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/temporal-sql-tool" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "temporal-sql-tool";
    "org.opencontainers.image.description" = "Temporal SQL schema management tool";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
