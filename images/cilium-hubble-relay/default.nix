{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-hubble-relay
# Cilium networking

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cilium-hubble-relay";
    inherit version;
    src = fetchFromGitHub {
      owner = "cilium";
      repo = "cilium";
      rev = "v${version}";
      hash = "sha256-bSXOa8txx4AMpv0IWJ0Fy/4loAG3rBYPsGLsaxqPkSo=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "cilium-hubble-relay";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cilium-hubble-relay" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "cilium-hubble-relay";
    "org.opencontainers.image.description" = "Cilium cilium-hubble-relay";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
  };
}