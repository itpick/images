{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-api
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dashboard-api = buildGoModule {
    pname = "kubernetes-dashboard-api";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dashboard-api" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dashboard-api;
  name = "kubernetes-dashboard-api";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dashboard-api}/bin/dashboard-api" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dashuoard api";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-api";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
