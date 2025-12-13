{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-proxy
# Kubernetes component

let
  version = "1.34.0";
  kube-proxy = buildGoModule {
    pname = "kube-proxy";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/proxy" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-proxy;
  name = "kube-proxy";
  tag = "v${version}";
  entrypoint = [ "${kube-proxy}/bin/proxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue proxy";
    "org.opencontainers.image.description" = "Kubernetes kube-proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
