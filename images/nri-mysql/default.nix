{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-mysql
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-mysql";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/mysql" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-mysql";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/mysql" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri mysql";
    "org.opencontainers.image.description" = "NRI plugin nri-mysql";
    "org.opencontainers.image.version" = version;
  };
}
