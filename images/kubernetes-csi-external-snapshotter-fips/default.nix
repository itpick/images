{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-external-snapshotter-fips
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-external-snapshotter = buildGoModule {
    pname = "kubernetes-csi-external-snapshotter-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-external-snapshotter" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-external-snapshotter;
  name = "kubernetes-csi-external-snapshotter-fips";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-external-snapshotter}/bin/csi-external-snapshotter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi external snapshotter";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-external-snapshotter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
