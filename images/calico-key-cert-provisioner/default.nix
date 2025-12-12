{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-key-cert-provisioner
# Calico networking component

let
  version = "3.29.0";
  calico-component = buildGoModule {
    pname = "calico-key-cert-provisioner";
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
  name = "calico-key-cert-provisioner";
  tag = "v${version}";
  entrypoint = [ "${calico-component}/bin/key-cert-provisioner" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "calico key cert provisioner";
    "org.opencontainers.image.description" = "Calico calico-key-cert-provisioner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
  };
}
