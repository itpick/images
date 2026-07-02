{ mkImage, pkgs, lib, ... }:

# pgpool2_exporter-fips - Prometheus exporter for Pgpool-II (variant)
# https://github.com/pgpool/pgpool2_exporter
# Note: no FIPS claim; naming variant of pgpool2_exporter.
#
# Built from source with nixpkgs' current Go — see pgpool2_exporter/default.nix.

let
  version = "1.2.2";

  drv = pkgs.buildGoModule {
    pname = "pgpool2_exporter-fips";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "pgpool";
      repo = "pgpool2_exporter";
      rev = "v${version}";
      hash = "sha256-0W6v51+r+CbLfuPZxRAeT8/WELASJ6ueRxvUcZuM5Sc=";
    };

    vendorHash = "sha256-66ygOVY8cOPzuj2sFGSkiecEB1n7fZgT0GnLg086bq4=";

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };
in mkImage {
  inherit drv;
  name = "pgpool2_exporter-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pgpool2_exporter" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "pgpool2_exporter-fips";
    "org.opencontainers.image.description" = "Prometheus exporter for Pgpool-II";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
