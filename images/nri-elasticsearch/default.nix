{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-elasticsearch
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-elasticsearch";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/elasticsearch" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-elasticsearch";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/elasticsearch" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri elasticsearch";
    "org.opencontainers.image.description" = "NRI plugin nri-elasticsearch";
    "org.opencontainers.image.version" = version;
  };
}
