{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-agent-fips
# Cilium networking

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cilium-agent-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "cilium";
      repo = "cilium";
      rev = "v${version}";
      hash = "sha256-bSXOa8txx4AMpv0IWJ0Fy/4loAG3rBYPsGLsaxqPkSo=";
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
  name = "cilium-agent-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cilium-agent" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables iproute2 ];
  labels = {
    "org.opencontainers.image.title" = "cilium-agent-fips";
    "org.opencontainers.image.description" = "Cilium cilium-agent";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
