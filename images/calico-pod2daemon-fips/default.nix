{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-pod2daemon-fips
# Calico networking component

let
  version = "3.29.0";
  calico-component = buildGoModule {
    pname = "calico-pod2daemon-fips";
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
  drv = calico-component;
  name = "calico-pod2daemon-fips";
  tag = "v${version}";
  entrypoint = [ "${calico-component}/bin/pod2daemon" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "calico pod2daemon";
    "org.opencontainers.image.description" = "Calico calico-pod2daemon";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
