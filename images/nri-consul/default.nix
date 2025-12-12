{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-consul
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-consul";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/consul" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-consul";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/consul" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri consul";
    "org.opencontainers.image.description" = "NRI plugin nri-consul";
    "org.opencontainers.image.version" = version;
  };
}
