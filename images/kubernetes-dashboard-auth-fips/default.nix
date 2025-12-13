{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-auth-fips
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dashboard-auth = buildGoModule {
    pname = "kubernetes-dashboard-auth-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dashboard-auth" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dashboard-auth;
  name = "kubernetes-dashboard-auth-fips";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dashboard-auth}/bin/dashboard-auth" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dashuoard auth";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-auth";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
