{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-external-attacher
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-external-attacher = buildGoModule {
    pname = "kubernetes-csi-external-attacher";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-external-attacher" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-external-attacher;
  name = "kubernetes-csi-external-attacher";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-external-attacher}/bin/csi-external-attacher" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi external attacher";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-external-attacher";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
