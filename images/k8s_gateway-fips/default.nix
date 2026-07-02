{ mkImage, pkgs, lib, ... }:

# k8s_gateway-fips - same upstream tool as k8s_gateway (naming variant;
# no FIPS claim).
# https://github.com/ori-edge/k8s_gateway
#
# Built from source with nixpkgs' current Go — see k8s_gateway/default.nix.

let
  version = "0.4.0";

  drv = pkgs.buildGoModule {
    pname = "k8s_gateway-fips";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "ori-edge";
      repo = "k8s_gateway";
      rev = "v${version}";
      hash = "sha256-O2sQ/o3Me7hLzjgr/lcU+mm4nWrWu3k94+MoaPkoKi8=";
    };

    vendorHash = "sha256-2F4RlNdI5iyQuqxXFrzNpyHsqGFEiDnNxLBLohTjfYQ=";

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;

    postInstall = ''
      if [ -f "$out/bin/coredns" ]; then
        mv "$out/bin/coredns" "$out/bin/k8s_gateway"
      fi
    '';
  };

in mkImage {
  inherit drv;
  name = "k8s_gateway-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/k8s_gateway" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "k8s_gateway-fips";
    "org.opencontainers.image.description" = "CoreDNS-based DNS server for exposing Kubernetes resources externally";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
