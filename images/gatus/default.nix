# gatus
# =============
# Gatus - Automated service health dashboard
# https://github.com/TwiN/gatus
#
# Gatus is a developer-oriented health dashboard that gives you
# the ability to monitor your services.

{ mkImage, pkgs, lib, ... }:

let
  # Gatus refuses to start without a config (ErrConfigFileNotFound). Bake a
  # minimal one at /etc/gatus/config.yaml and point GATUS_CONFIG_PATH at it:
  # bind the dashboard/API on 0.0.0.0:8080, use the default in-memory store (no
  # writable dir needed), and monitor gatus's own /health endpoint so the image
  # is self-contained. Operators mount their own config with real endpoints
  # (and a sqlite/postgres store for persistence).
  gatusConfig = pkgs.writeTextDir "etc/gatus/config.yaml" ''
    web:
      address: "0.0.0.0"
      port: 8080

    endpoints:
      - name: gatus
        url: "http://localhost:8080/health"
        interval: 60s
        conditions:
          - "[STATUS] == 200"
  '';

in
mkImage {
  drv = pkgs.gatus;
  name = "gatus";
  tag = "v${pkgs.gatus.version}";
  entrypoint = [ "${pkgs.gatus}/bin/gatus" ];
  cmd = [];

  env = {
    GATUS_CONFIG_PATH = "/etc/gatus/config.yaml";
  };

  extraPkgs = with pkgs; [ cacert gatusConfig ];

  labels = {
    "org.opencontainers.image.title" = "Gatus";
    "org.opencontainers.image.description" = "Automated service health dashboard";
    "org.opencontainers.image.version" = pkgs.gatus.version;
  };
}
