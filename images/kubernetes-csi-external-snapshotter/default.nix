{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-external-snapshotter
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-external-snapshotter = buildGoModule {
    pname = "kubernetes-csi-external-snapshotter";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-external-snapshotter" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-external-snapshotter;
  name = "kubernetes-csi-external-snapshotter";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-external-snapshotter}/bin/csi-external-snapshotter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi external snapshotter";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-external-snapshotter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
