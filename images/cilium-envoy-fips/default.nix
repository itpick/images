{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-envoy-fips
# Cilium networking component

let
  version = "1.17.0";
  cilium-component = buildGoModule {
    pname = "cilium-envoy-fips";
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
  drv = cilium-component;
  name = "cilium-envoy-fips";
  tag = "v${version}";
  entrypoint = [ "${cilium-component}/bin/envoy" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "cilium envoy";
    "org.opencontainers.image.description" = "Cilium cilium-envoy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
