{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-kube-controllers-fips
# Calico networking component

let
  version = "3.29.0";
  calico-component = buildGoModule {
    pname = "calico-kube-controllers-fips";
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
  drv = calico-component;
  name = "calico-kube-controllers-fips";
  tag = "v${version}";
  entrypoint = [ "${calico-component}/bin/kube-controllers" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "calico kube controllers";
    "org.opencontainers.image.description" = "Calico calico-kube-controllers";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
