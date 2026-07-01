{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-prometheus-exporter
# https://github.com/nginx/nginx-prometheus-exporter

let
  exporterPackages = with pkgs; [
    prometheus-nginx-exporter
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "nginx-prometheus-exporter";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.prometheus-nginx-exporter.version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-prometheus-exporter-root";
      paths = base.basePackages ++ exporterPackages ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # Was a bare stub (no Cmd), so the kind-test pod fails with "no command
    # specified". Run the exporter: it's pull-based, so it starts and serves
    # /metrics on 0.0.0.0:9113 (default is :9113, i.e. all interfaces already,
    # but bind explicitly) regardless of whether the scraped nginx (default
    # --nginx.scrape-uri http://127.0.0.1:8080/stub_status) is reachable — it
    # only scrapes on each /metrics request. Operators set --nginx.scrape-uri to
    # their nginx stub_status endpoint.
    Entrypoint = [ "${pkgs.prometheus-nginx-exporter}/bin/nginx-prometheus-exporter" ];
    Cmd = [ "--web.listen-address=0.0.0.0:9113" ];
    ExposedPorts = {
      "9113/tcp" = { };
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath exporterPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nginx prometheus exporter";
      "org.opencontainers.image.description" = "Prometheus exporter for NGINX and NGINX Plus metrics";
      "org.opencontainers.image.version" = pkgs.prometheus-nginx-exporter.version;
    };
  };
}
