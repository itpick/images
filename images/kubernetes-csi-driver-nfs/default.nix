{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-driver-nfs
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-driver-nfs = buildGoModule {
    pname = "kubernetes-csi-driver-nfs";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-driver-nfs" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-driver-nfs;
  name = "kubernetes-csi-driver-nfs";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-driver-nfs}/bin/csi-driver-nfs" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi driver nfs";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-driver-nfs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
