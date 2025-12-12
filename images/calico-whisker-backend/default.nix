{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-whisker-backend
# Calico networking component

let
  version = "3.29.0";
  calico-component = buildGoModule {
    pname = "calico-whisker-backend";
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
  name = "calico-whisker-backend";
  tag = "v${version}";
  entrypoint = [ "${calico-component}/bin/whisker-backend" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "calico whisker backend";
    "org.opencontainers.image.description" = "Calico calico-whisker-backend";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
  };
}
