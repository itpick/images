{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-kubeadm-bootstrap-controller-fips
# Cluster API component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "cluster-api-kubeadm-bootstrap-controller-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "cluster-api";
      rev = "v${version}";
      hash = "sha256-ENbNgstu+YsNESJ2RsJri3B4zO8UI3Dt60/8AFgsxn8=";
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
  name = "cluster-api-kubeadm-bootstrap-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cluster-api-kubeadm-bootstrap-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster-api-kubeadm-bootstrap-controller-fips";
    "org.opencontainers.image.description" = "Cluster API cluster-api-kubeadm-bootstrap-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}