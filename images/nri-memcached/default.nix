{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-memcached
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-memcached";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/memcached" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-memcached";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/memcached" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri memcached";
    "org.opencontainers.image.description" = "NRI plugin nri-memcached";
    "org.opencontainers.image.version" = version;
  };
}
