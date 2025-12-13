{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-node-driver-registrar
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-node-driver-registrar = buildGoModule {
    pname = "kubernetes-csi-node-driver-registrar";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-node-driver-registrar" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-node-driver-registrar;
  name = "kubernetes-csi-node-driver-registrar";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-node-driver-registrar}/bin/csi-node-driver-registrar" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi node driver registrar";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-node-driver-registrar";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
