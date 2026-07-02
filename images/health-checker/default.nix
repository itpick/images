{ mkImage, pkgs, lib, ... }:

# health-checker - a simple HTTP server for health-checking TCP ports
# https://github.com/gruntwork-io/health-checker
#
# Upstream's v0.0.8 release ships a prebuilt binary built against an
# old Go toolchain (multiple crit stdlib CVEs). No newer release
# exists, so rebuild from source at the same tag with nixpkgs' current
# Go to pick up the stdlib rebuild.

let
  version = "0.0.8";

  drv = pkgs.buildGoModule {
    pname = "health-checker";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "gruntwork-io";
      repo = "health-checker";
      rev = "v${version}";
      hash = "sha256-GVBqph125vMZG/mNn61pxLwpTxjxPLLauC0i0QZS7A8=";
    };

    vendorHash = "sha256-fJI7NY3hyACvOqvS00a4iNxAtQS50lhGg4yC8SW6Oro=";

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };
in mkImage {
  inherit drv;
  name = "health-checker";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/health-checker" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "health-checker";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
