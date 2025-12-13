{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-scheduler-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-scheduler = buildGoModule {
    pname = "kube-scheduler-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/scheduler" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-scheduler;
  name = "kube-scheduler-fips-1.34-default";
  tag = "v${version}";
  entrypoint = [ "${kube-scheduler}/bin/scheduler" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue scheduler";
    "org.opencontainers.image.description" = "Kubernetes kube-scheduler";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
