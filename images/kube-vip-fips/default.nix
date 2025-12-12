{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-vip-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-vip = buildGoModule {
    pname = "kube-vip-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/vip" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-vip;
  name = "kube-vip-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-vip}/bin/vip" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue vip";
    "org.opencontainers.image.description" = "Kubernetes kube-vip";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
