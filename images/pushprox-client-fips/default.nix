{ mkImage, pkgs, lib, ... }:

# PushProx client (variant) - registers with the PushProx proxy so
# Prometheus can scrape targets behind NAT/firewalls.
# https://github.com/prometheus-community/PushProx
# Note: no FIPS claim; naming variant of pushprox-client.
#
# Built from source with nixpkgs' current Go — see pushprox/default.nix.

let
  version = "0.2.0";

  drv = pkgs.buildGoModule {
    pname = "pushprox-client-fips";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "prometheus-community";
      repo = "PushProx";
      rev = "v${version}";
      hash = "sha256-r96HMv34llkoAeFS37TpSvG7By8CM52Sfo2uC9uUpu8=";
    };

    vendorHash = "sha256-K98Ay3H7/RAoKxB5A1h6C2XZqKNXJYvlwqrY2AEKLLs=";

    subPackages = [ "cmd/client" ];

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;

    postInstall = ''
      mv $out/bin/client $out/bin/pushprox-client
    '';
  };
in mkImage {
  inherit drv;
  name = "pushprox-client-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pushprox-client" ];
  cmd = [ "--fqdn=0.0.0.0" ];
  labels = {
    "org.opencontainers.image.title" = "pushprox-client-fips";
    "org.opencontainers.image.description" = "PushProx client for Prometheus scraping through NAT/firewalls";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
