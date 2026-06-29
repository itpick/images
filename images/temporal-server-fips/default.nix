{ mkImage, pkgs, lib, ... }:

# Temporal Server (FIPS-variant image) - packages the upstream temporal-server binary
# https://github.com/temporalio/temporal
let
  version = "1.31.1";
  drv = pkgs.stdenv.mkDerivation {
    pname = "temporal-server-fips";
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
      install -Dm755 temporal-server $out/bin/temporal-server
      cp -r config $out/config
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "temporal-server-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/temporal-server" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "temporal-server-fips";
    "org.opencontainers.image.description" = "Temporal durable execution platform server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
