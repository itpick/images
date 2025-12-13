{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-webhook-certgen-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-webhook-certgen = buildGoModule {
    pname = "kube-webhook-certgen-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/webhook-certgen" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-webhook-certgen;
  name = "kube-webhook-certgen-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-webhook-certgen}/bin/webhook-certgen" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue weuhook certgen";
    "org.opencontainers.image.description" = "Kubernetes kube-webhook-certgen";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
