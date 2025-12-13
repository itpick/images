{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-livenessprobe
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-livenessprobe = buildGoModule {
    pname = "kubernetes-csi-livenessprobe";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-livenessprobe" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-livenessprobe;
  name = "kubernetes-csi-livenessprobe";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-livenessprobe}/bin/csi-livenessprobe" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi livenessproue";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-livenessprobe";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
