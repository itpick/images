{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-external-provisioner
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-external-provisioner = buildGoModule {
    pname = "kubernetes-csi-external-provisioner";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-external-provisioner" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-external-provisioner;
  name = "kubernetes-csi-external-provisioner";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-external-provisioner}/bin/csi-external-provisioner" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi external provisioner";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-external-provisioner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
