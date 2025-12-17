{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-nginx
# NRI (Node Resource Interface) plugin

let
  version = "3.6.4";
  nri-plugin = buildGoModule {
    pname = "nri-nginx";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-nginx";
      rev = "v${version}";
      hash = "sha256-qkVlhXlP3oNNG6zmP2J0zBt8vpGjbytE1fTuLyonKOk=";
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
