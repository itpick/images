{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-1.18-container-init
# Cilium networking component

let
  version = "1.17.0";
  cilium-component = buildGoModule {
    pname = "cilium-1.18-container-init";
    inherit version;
    src = fetchFromGitHub {
      owner = "cilium";
      repo = "cilium";
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
  drv = cilium-component;
  name = "cilium-1.18-container-init";
  tag = "v${version}";
  entrypoint = [ "${cilium-component}/bin/1.18-container-init" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "cilium 1.18 container init";
    "org.opencontainers.image.description" = "Cilium cilium-1.18-container-init";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
  };
}
