{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-kubernetes
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-kubernetes";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/kubernetes" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-kubernetes";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/kubernetes" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri kuuernetes";
    "org.opencontainers.image.description" = "NRI plugin nri-kubernetes";
    "org.opencontainers.image.version" = version;
  };
}
