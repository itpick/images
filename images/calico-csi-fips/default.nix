{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-csi-fips
# Calico networking component

let
  version = "3.29.0";
  component = buildGoModule {
    pname = "calico-csi-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "projectcalico";
      repo = "calico";
      rev = "v${version}";
      hash = "sha256-bgcY/unCLAtPOeEwRJGl8u1dHYdO3tSzMTg47DHOsJM=";
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
  name = "calico-csi-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/calico-csi" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "calico-csi-fips";
    "org.opencontainers.image.description" = "Calico calico-csi";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
