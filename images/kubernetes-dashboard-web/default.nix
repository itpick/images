{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-web
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dashboard-web = buildGoModule {
    pname = "kubernetes-dashboard-web";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dashboard-web" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dashboard-web;
  name = "kubernetes-dashboard-web";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dashboard-web}/bin/dashboard-web" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dashuoard web";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-web";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
