{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-haproxy
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-haproxy";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/haproxy" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-haproxy";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/haproxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri haproxy";
    "org.opencontainers.image.description" = "NRI plugin nri-haproxy";
    "org.opencontainers.image.version" = version;
  };
}
