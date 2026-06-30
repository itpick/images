{ mkImage, pkgs, lib, ... }:

# pushprox - proxy enabling Prometheus to scrape through NAT/firewalls
# https://github.com/prometheus-community/PushProx

let
  version = "0.2.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pushprox";
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
      install -Dm755 pushprox-client $out/bin/pushprox-client
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pushprox";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pushprox-proxy" ];
  # Was `--help` (a one-shot). Run the proxy server: clients register with it and
  # Prometheus scrapes targets through it. Bind 0.0.0.0:8080 (the default is
  # :8080) so the kind-test probe can reach it. No config or writable dir needed.
  cmd = [ "--web.listen-address=0.0.0.0:8080" ];
  labels = {
    "org.opencontainers.image.title" = "pushprox";
    "org.opencontainers.image.description" = "PushProx proxy for scraping Prometheus targets behind NAT/firewalls";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
