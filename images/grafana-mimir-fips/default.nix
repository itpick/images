{ mkImage, pkgs, lib, ... }:

# Grafana Mimir (fips image variant; packaged from the upstream Mimir binary)
# https://github.com/grafana/mimir
let
  version = "3.1.2";
  drv = pkgs.stdenv.mkDerivation {
    pname = "grafana-mimir-fips";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/grafana/mimir/releases/download/mimir-${version}/mimir-linux-amd64";
      hash = "sha256-wKvT7ACerbNClyUwEjSX1cTvhYG1QtZaOQdbP1vKV6s=";
    };
    dontUnpack = true;
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/mimir
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "grafana-mimir-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/mimir" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "grafana-mimir-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
