{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dns-node-cache
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dns-node-cache = buildGoModule {
    pname = "kubernetes-dns-node-cache";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dns-node-cache" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dns-node-cache;
  name = "kubernetes-dns-node-cache";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dns-node-cache}/bin/dns-node-cache" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dns node cache";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dns-node-cache";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
