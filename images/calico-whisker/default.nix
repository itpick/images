{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-whisker
# Calico networking component

let
  version = "3.29.0";
  calico-component = buildGoModule {
    pname = "calico-whisker";
    inherit version;
    src = fetchFromGitHub {
      owner = "projectcalico";
      repo = "calico";
      rev = "v${version}";
      hash = "sha256-bgcY/unCLAtPOeEwRJGl8u1dHYdO3tSzMTg47DHOsJM=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = calico-component;
  name = "calico-whisker";
  tag = "v${version}";
  entrypoint = [ "${calico-component}/bin/whisker" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "calico whisker";
    "org.opencontainers.image.description" = "Calico calico-whisker";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
  };
}
