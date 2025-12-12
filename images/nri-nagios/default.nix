{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-nagios
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-nagios";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/nagios" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-nagios";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/nagios" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri nagios";
    "org.opencontainers.image.description" = "NRI plugin nri-nagios";
    "org.opencontainers.image.version" = version;
  };
}
