{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-rbac-proxy-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-rbac-proxy = buildGoModule {
    pname = "kube-rbac-proxy-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/rbac-proxy" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-rbac-proxy;
  name = "kube-rbac-proxy-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-rbac-proxy}/bin/rbac-proxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue ruac proxy";
    "org.opencontainers.image.description" = "Kubernetes kube-rbac-proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
