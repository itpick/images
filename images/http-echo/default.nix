{ mkImage, pkgs, lib, ... }:

# http-echo - tiny HTTP server that echoes a response (HashiCorp)
# https://github.com/hashicorp/http-echo
#
# v1.0.0 prebuilt from releases.hashicorp.com is Go-stdlib stale
# (4 crit CVEs). Rebuild from source with nixpkgs' current Go.

let
  version = "1.0.0";

  drv = pkgs.buildGoModule {
    pname = "http-echo";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "hashicorp";
      repo = "http-echo";
      rev = "v${version}";
      hash = "sha256-LybeXldGYQZ4w66QXPQRI0wBmj05/A7cDvR0WTArEm8=";
    };

    vendorHash = null;

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };
in mkImage {
  inherit drv;
  name = "http-echo";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/http-echo" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "http-echo";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}