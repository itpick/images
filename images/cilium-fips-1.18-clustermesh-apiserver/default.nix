{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-fips-1.18-clustermesh-apiserver-fips
# Cilium networking component

let
  version = "1.17.0";
  cilium-component = buildGoModule {
    pname = "cilium-fips-1.18-clustermesh-apiserver";
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
  name = "cilium-fips-1.18-clustermesh-apiserver";
  tag = "v${version}";
  entrypoint = [ "${cilium-component}/bin/fips-1.18-clustermesh-apiserver" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "cilium fips 1.18 clustermesh apiserver";
    "org.opencontainers.image.description" = "Cilium cilium-fips-1.18-clustermesh-apiserver";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
