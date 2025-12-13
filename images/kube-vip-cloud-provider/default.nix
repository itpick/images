{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-vip-cloud-provider
# Kubernetes component

let
  version = "1.34.0";
  kube-vip-cloud-provider = buildGoModule {
    pname = "kube-vip-cloud-provider";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/vip-cloud-provider" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-vip-cloud-provider;
  name = "kube-vip-cloud-provider";
  tag = "v${version}";
  entrypoint = [ "${kube-vip-cloud-provider}/bin/vip-cloud-provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue vip cloud provider";
    "org.opencontainers.image.description" = "Kubernetes kube-vip-cloud-provider";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
