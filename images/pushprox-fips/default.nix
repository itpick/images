{ mkImage, pkgs, lib, ... }:

# PushProx proxy - proxy to allow Prometheus to scrape through NAT/firewalls
# https://github.com/prometheus-community/PushProx
# Note: packages the upstream prebuilt binary; no FIPS claim is made.

let
  version = "0.2.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pushprox-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/prometheus-community/PushProx/releases/download/v${version}/PushProx-${version}.linux-amd64.tar.gz";
      hash = "sha256-x1zAXQeNWVcbi9plYDlYTcS3vpX8irUzK/q7AsLIBqM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "PushProx-${version}.linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 pushprox-proxy $out/bin/pushprox-proxy
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pushprox-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pushprox-proxy" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pushprox-fips";
    "org.opencontainers.image.description" = "PushProx proxy for Prometheus scraping through NAT/firewalls";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
