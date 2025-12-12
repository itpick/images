{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-kubeadm-control-plane-controller-fips
# Cluster API component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "cluster-api-kubeadm-control-plane-controller-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "cluster-api";
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
  name = "cluster-api-kubeadm-control-plane-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cluster-api-kubeadm-control-plane-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster-api-kubeadm-control-plane-controller-fips";
    "org.opencontainers.image.description" = "Cluster API cluster-api-kubeadm-control-plane-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
