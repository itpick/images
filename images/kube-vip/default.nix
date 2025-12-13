{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-vip
# Kubernetes component

let
  version = "1.34.0";
  kube-vip = buildGoModule {
    pname = "kube-vip";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/vip" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-vip;
  name = "kube-vip";
  tag = "v${version}";
  entrypoint = [ "${kube-vip}/bin/vip" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue vip";
    "org.opencontainers.image.description" = "Kubernetes kube-vip";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
