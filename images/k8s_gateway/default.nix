{ mkImage, pkgs, lib, ... }:

# k8s_gateway - CoreDNS-based DNS server for Kubernetes Ingress/Service hostnames
# https://github.com/ori-edge/k8s_gateway
#
# v0.4.0 prebuilt is Go-stdlib stale (4 crit CVEs). Rebuild from source
# at same tag with nixpkgs' Go. The upstream Makefile builds a CoreDNS
# binary with the k8s_gateway plugin baked in — same approach here via
# buildGoModule.

let
  version = "0.4.0";

  drv = pkgs.buildGoModule {
    pname = "k8s_gateway";
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

    # Upstream builds under `coredns` binary name; rename to match the
    # installPhase target in the prior prebuilt version.
    postInstall = ''
      if [ -f "$out/bin/coredns" ]; then
        mv "$out/bin/coredns" "$out/bin/k8s_gateway"
      fi
    '';
  };

in mkImage {
  inherit drv;
  name = "k8s_gateway";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/k8s_gateway" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "k8s_gateway";
    "org.opencontainers.image.description" = "CoreDNS-based DNS server for exposing Kubernetes resources externally";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
