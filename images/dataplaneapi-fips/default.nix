{ mkImage, pkgs, lib, ... }:

# HAProxy Data Plane API - REST API for dynamic HAProxy configuration
# https://github.com/haproxytech/dataplaneapi
# The -fips variant packages the same upstream dataplaneapi binary.

let
  version = "3.4.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dataplaneapi";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/haproxytech/dataplaneapi/releases/download/v${version}/dataplaneapi_${version}_linux_x86_64.tar.gz";
      hash = "sha256-jwOOU6Mq73f6rcr63HCxhTiOEEY2yWNQBLpNqQch7h0=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 dataplaneapi $out/bin/dataplaneapi
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "dataplaneapi-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/dataplaneapi" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dataplaneapi-fips";
    "org.opencontainers.image.description" = "HAProxy Data Plane API";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
