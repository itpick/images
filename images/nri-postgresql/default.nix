{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-postgresql
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-postgresql";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/postgresql" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-postgresql";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/postgresql" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri postgresql";
    "org.opencontainers.image.description" = "NRI plugin nri-postgresql";
    "org.opencontainers.image.version" = version;
  };
}
