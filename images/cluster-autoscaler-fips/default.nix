{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-autoscaler-fips
# Cluster API component

let
  version = "1.9.0";
  cluster-component = buildGoModule {
    pname = "cluster-autoscaler-fips";
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
  drv = cluster-component;
  name = "cluster-autoscaler-fips";
  tag = "v${version}";
  entrypoint = [ "${cluster-component}/bin/autoscaler" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster autoscaler";
    "org.opencontainers.image.description" = "Cluster API cluster-autoscaler";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}