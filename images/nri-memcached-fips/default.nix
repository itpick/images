{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-memcached-fips
# NRI (Node Resource Interface) plugin

let
  version = "2.7.4";
  nri-plugin = buildGoModule {
    pname = "nri-memcached-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-memcached";
      rev = "v${version}";
      hash = "sha256-q+QKWQxzqzunG+qpQrsUcamzSZKFeRTRIrIoOPNza0g=";
    };

    vendorHash = null;
    subPackages = [ "cmd/memcached" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-memcached-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/memcached" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri memcached";
    "org.opencontainers.image.description" = "NRI plugin nri-memcached";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
