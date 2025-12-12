{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-typha-fips
# Calico networking component

let
  version = "3.29.0";
  component = buildGoModule {
    pname = "calico-typha-fips";
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
  name = "calico-typha-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/calico-typha" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "calico-typha-fips";
    "org.opencontainers.image.description" = "Calico calico-typha";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
