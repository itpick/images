{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-external-snapshot-controller-fips
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-external-snapshot-controller = buildGoModule {
    pname = "kubernetes-csi-external-snapshot-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-external-snapshot-controller" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-external-snapshot-controller;
  name = "kubernetes-csi-external-snapshot-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-external-snapshot-controller}/bin/csi-external-snapshot-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi external snapshot controller";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-external-snapshot-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
