{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-cassandra
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-cassandra";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/cassandra" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-cassandra";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/cassandra" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri cassandra";
    "org.opencontainers.image.description" = "NRI plugin nri-cassandra";
    "org.opencontainers.image.version" = version;
  };
}
