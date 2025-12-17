{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-shell
# Rancher component

let
  version = "0.6.1";
  rancher-component = buildGoModule {
    pname = "rancher-shell";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "shell";
      rev = "v${version}";
      hash = "sha256-cCUhzQuU6f0CKqQU2ee0AF7ZkT70IOWFeJxU5M/kZp4=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = rancher-component;
  name = "rancher-shell";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/shell" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher shell";
    "org.opencontainers.image.description" = "Rancher rancher-shell";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
