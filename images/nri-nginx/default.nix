{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-nginx
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-nginx";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/nginx" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-nginx";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/nginx" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri nginx";
    "org.opencontainers.image.description" = "NRI plugin nri-nginx";
    "org.opencontainers.image.version" = version;
  };
}
