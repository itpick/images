{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# calico-node-driver-registrar
# Calico networking component

let
  version = "3.29.0";
  component = buildGoModule {
    pname = "calico-node-driver-registrar";
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
  drv = component;
  name = "calico-node-driver-registrar";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/calico-node-driver-registrar" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "calico-node-driver-registrar";
    "org.opencontainers.image.description" = "Calico calico-node-driver-registrar";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "calico";
  };
}
