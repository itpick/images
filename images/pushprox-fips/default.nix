{ mkImage, pkgs, lib, ... }:

# PushProx proxy (variant) - proxy to allow Prometheus to scrape through
# NAT/firewalls. https://github.com/prometheus-community/PushProx
# Note: no FIPS claim; naming variant of pushprox.
#
# Built from source with nixpkgs' current Go — see pushprox/default.nix.

let
  version = "0.2.0";

  drv = pkgs.buildGoModule {
    pname = "pushprox-fips";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "prometheus-community";
      repo = "PushProx";
      rev = "v${version}";
      hash = "sha256-r96HMv34llkoAeFS37TpSvG7By8CM52Sfo2uC9uUpu8=";
    };

    vendorHash = "sha256-K98Ay3H7/RAoKxB5A1h6C2XZqKNXJYvlwqrY2AEKLLs=";

    subPackages = [ "cmd/proxy" ];

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;

    postInstall = ''
      mv $out/bin/proxy $out/bin/pushprox-proxy
    '';
  };
in mkImage {
  inherit drv;
  name = "pushprox-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pushprox-proxy" ];
  cmd = [ "--web.listen-address=0.0.0.0:8080" ];
  labels = {
    "org.opencontainers.image.title" = "pushprox-fips";
    "org.opencontainers.image.description" = "PushProx proxy for Prometheus scraping through NAT/firewalls";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
