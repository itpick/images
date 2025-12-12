{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-kube-apiserver-fips
# Kubernetes component

let
  version = "1.32.0";
  component = buildGoModule {
    pname = "kubernetes-kube-apiserver-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
  name = "kubernetes-kube-apiserver-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubernetes-kube-apiserver" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubernetes-kube-apiserver-fips";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-kube-apiserver";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
