{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-1.18-hubble-relay
# Cilium networking component

let
  version = "1.19.5";
  cilium-component = buildGoModule {
    pname = "cilium-1.18-hubble-relay";
    inherit version;
    src = fetchFromGitHub {
      owner = "cilium";
      repo = "cilium";
      rev = "v${version}";
      hash = "sha256-0/GlsmRG6YuHJ8ROoVrCiksFf1+wokxUEzO6V6gvme4=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = cilium-component;
  name = "cilium-1.18-hubble-relay";
  tag = "v${version}";
  entrypoint = [ "${cilium-component}/bin/1.18-hubble-relay" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "cilium 1.18 hubble relay";
    "org.opencontainers.image.description" = "Cilium cilium-1.18-hubble-relay";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
  };
}
