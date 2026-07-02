{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-operator-generic
# Cilium networking

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cilium-operator-generic";
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
  name = "cilium-operator-generic";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cilium-operator-generic" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "cilium-operator-generic";
    "org.opencontainers.image.description" = "Cilium cilium-operator-generic";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
  };
}