{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-node
# Calico networking component

let
  version = "3.29.0";
  calico-component = buildGoModule {
    pname = "calico-node";
    inherit version;
    src = fetchFromGitHub {
      owner = "projectcalico";
      repo = "calico";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = calico-component;
  name = "calico-node";
  tag = "v${version}";
  entrypoint = [ "${calico-component}/bin/node" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "calico node";
    "org.opencontainers.image.description" = "Calico calico-node";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
  };
}
