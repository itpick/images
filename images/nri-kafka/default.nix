{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-kafka
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-kafka";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/kafka" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-kafka";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/kafka" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri kafka";
    "org.opencontainers.image.description" = "NRI plugin nri-kafka";
    "org.opencontainers.image.version" = version;
  };
}
