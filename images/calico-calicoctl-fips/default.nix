{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-calicoctl-fips
# Calico networking component

let
  version = "3.29.0";
  component = buildGoModule {
    pname = "calico-calicoctl-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "projectcalico";
      repo = "calico";
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
  name = "calico-calicoctl-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/calico-calicoctl" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "calico-calicoctl-fips";
    "org.opencontainers.image.description" = "Calico calico-calicoctl";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
