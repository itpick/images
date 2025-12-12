{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-external-health-monitor
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-external-health-monitor = buildGoModule {
    pname = "kubernetes-csi-external-health-monitor";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-external-health-monitor" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-external-health-monitor;
  name = "kubernetes-csi-external-health-monitor";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-external-health-monitor}/bin/csi-external-health-monitor" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi external health monitor";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-external-health-monitor";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
