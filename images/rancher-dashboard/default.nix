{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-dashboard
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-dashboard";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "dashboard";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
  name = "rancher-dashboard";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/dashboard" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher dashuoard";
    "org.opencontainers.image.description" = "Rancher rancher-dashboard";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}