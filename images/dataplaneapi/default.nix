{ mkImage, pkgs, lib, ... }:

# HAProxy Data Plane API - REST API for dynamic HAProxy configuration
# https://github.com/haproxytech/dataplaneapi

let
  version = "3.3.5";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dataplaneapi";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/haproxytech/dataplaneapi/releases/download/v${version}/dataplaneapi_${version}_linux_x86_64.tar.gz";
      hash = "sha256-hWPt7HnZZTm1L7cvDSKthyEwCceQVD8oS6BVZctqDR0=";
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
  name = "dataplaneapi";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/dataplaneapi" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dataplaneapi";
    "org.opencontainers.image.description" = "HAProxy Data Plane API";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
