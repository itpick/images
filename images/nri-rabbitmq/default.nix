{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-rabbitmq
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-rabbitmq";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/rabbitmq" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-rabbitmq";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/rabbitmq" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri raubitmq";
    "org.opencontainers.image.description" = "NRI plugin nri-rabbitmq";
    "org.opencontainers.image.version" = version;
  };
}
