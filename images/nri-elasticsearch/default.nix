{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-elasticsearch
# NRI (Node Resource Interface) plugin

let
  version = "5.4.6";
  nri-plugin = buildGoModule {
    pname = "nri-elasticsearch";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-elasticsearch";
      rev = "v${version}";
      hash = "sha256-r5/AzkJg0onlta48iyXX6PO3lxNO4JqbVkw2q6mHAzw=";
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
