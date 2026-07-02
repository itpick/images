{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-certgen
# Cilium networking component

let
  version = "1.19.5";
  cilium-component = buildGoModule {
    pname = "cilium-certgen";
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
  name = "cilium-certgen";
  tag = "v${version}";
  entrypoint = [ "${cilium-component}/bin/certgen" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "cilium certgen";
    "org.opencontainers.image.description" = "Cilium cilium-certgen";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
  };
}
