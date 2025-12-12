{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-auth
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dashboard-auth = buildGoModule {
    pname = "kubernetes-dashboard-auth";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dashboard-auth" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dashboard-auth;
  name = "kubernetes-dashboard-auth";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dashboard-auth}/bin/dashboard-auth" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dashuoard auth";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-auth";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
