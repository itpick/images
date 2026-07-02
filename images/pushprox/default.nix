{ mkImage, pkgs, lib, ... }:

# pushprox - proxy enabling Prometheus to scrape through NAT/firewalls
# https://github.com/prometheus-community/PushProx
#
# Upstream ships the v0.2.0 release binary built against Go 1.22.1
# (2 crit Go-stdlib CVEs unfixed at that toolchain). No newer release
# exists, so rebuild from source with nixpkgs' current Go toolchain to
# pick up the stdlib rebuild.

let
  version = "0.2.0";

  drv = pkgs.buildGoModule {
    pname = "pushprox";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "prometheus-community";
      repo = "PushProx";
      rev = "v${version}";
      hash = "sha256-r96HMv34llkoAeFS37TpSvG7By8CM52Sfo2uC9uUpu8=";
    };

    vendorHash = "sha256-K98Ay3H7/RAoKxB5A1h6C2XZqKNXJYvlwqrY2AEKLLs=";

    subPackages = [ "cmd/client" "cmd/proxy" ];

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;

    # Upstream ships the binaries as pushprox-client / pushprox-proxy
    # but the source tree cmd/ dirs are named `client` and `proxy`.
    # Rename to keep the entrypoint stable.
    postInstall = ''
      mv $out/bin/client $out/bin/pushprox-client
      mv $out/bin/proxy $out/bin/pushprox-proxy
    '';
  };
in mkImage {
  inherit drv;
  name = "pushprox";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pushprox-proxy" ];
  cmd = [ "--web.listen-address=0.0.0.0:8080" ];
  labels = {
    "org.opencontainers.image.title" = "pushprox";
    "org.opencontainers.image.description" = "PushProx proxy for scraping Prometheus targets behind NAT/firewalls";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
