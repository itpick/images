{ mkImage, pkgs, lib, ... }:

# cfssl - CloudFlare's PKI/TLS toolkit
# https://github.com/cloudflare/cfssl
#
# Upstream's v1.6.5 prebuilt binaries were built against an old Go
# toolchain (8 crit Go-stdlib CVEs). Rebuild from source at the same
# tag with nixpkgs' current Go to pick up the stdlib rebuild.

let
  version = "1.6.5";

  drv = pkgs.buildGoModule {
    pname = "cfssl-self-sign-fips";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "cloudflare";
      repo = "cfssl";
      rev = "v${version}";
      hash = "sha256-Xczpv6tLJiy2dXoGJ0QUmXwOn0p6S+lm2oz61oytQec=";
    };

    # cfssl vendors its deps in-tree — no separate go-modules download.
    vendorHash = null;

    subPackages = [ "cmd/cfssl" "cmd/cfssljson" ];

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };
in
mkImage {
  inherit drv;
  name = "cfssl-self-sign-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cfssl" ];
  cmd = [ "version" ];
  labels = {
    "org.opencontainers.image.title" = "cfssl-self-sign-fips";
    "org.opencontainers.image.description" = "CloudFlare cfssl PKI/TLS toolkit";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
