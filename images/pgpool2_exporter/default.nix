{ mkImage, pkgs, lib, ... }:

# pgpool2_exporter - Prometheus exporter for Pgpool-II
# https://github.com/pgpool/pgpool2_exporter
#
# Upstream's v1.2.2 release ships a prebuilt binary built against Go
# 1.22.1 (2 crit Go-stdlib CVEs unfixed at that toolchain). No newer
# release exists, so rebuild from source with nixpkgs' current Go
# toolchain to pick up the stdlib rebuild.

let
  version = "1.2.2";

  drv = pkgs.buildGoModule {
    pname = "pgpool2_exporter";
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
  name = "pgpool2_exporter";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pgpool2_exporter" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "pgpool2_exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Pgpool-II";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
