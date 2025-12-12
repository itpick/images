{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-1.9-kubeadm-control-plane-controller
# Cluster API component

let
  version = "1.9.0";
  cluster-component = buildGoModule {
    pname = "cluster-api-1.9-kubeadm-control-plane-controller";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "cluster-api";
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
  drv = cluster-component;
  name = "cluster-api-1.9-kubeadm-control-plane-controller";
  tag = "v${version}";
  entrypoint = [ "${cluster-component}/bin/api-1.9-kubeadm-control-plane-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster api 1.9 kubeadm control plane controller";
    "org.opencontainers.image.description" = "Cluster API cluster-api-1.9-kubeadm-control-plane-controller";
    "org.opencontainers.image.version" = version;
  };
}
