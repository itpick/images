{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-hubble-relay-fips
# Cilium networking

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cilium-hubble-relay-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "cilium";
      repo = "cilium";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
  name = "cilium-hubble-relay-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cilium-hubble-relay" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "cilium-hubble-relay-fips";
    "org.opencontainers.image.description" = "Cilium cilium-hubble-relay";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
