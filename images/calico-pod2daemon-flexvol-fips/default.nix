{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-pod2daemon-flexvol-fips
# Calico networking component

let
  version = "3.29.0";
  component = buildGoModule {
    pname = "calico-pod2daemon-flexvol-fips";
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
  name = "calico-pod2daemon-flexvol-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/calico-pod2daemon-flexvol" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "calico-pod2daemon-flexvol-fips";
    "org.opencontainers.image.description" = "Calico calico-pod2daemon-flexvol";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
