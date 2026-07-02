{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-operator-aws-fips
# Cilium networking

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cilium-operator-aws-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "cilium";
      repo = "cilium";
      rev = "v${version}";
      hash = "sha256-bSXOa8txx4AMpv0IWJ0Fy/4loAG3rBYPsGLsaxqPkSo=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "cilium-operator-aws-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cilium-operator-aws" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "cilium-operator-aws-fips";
    "org.opencontainers.image.description" = "Cilium cilium-operator-aws";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}