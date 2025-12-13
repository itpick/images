{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-proxy-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-proxy = buildGoModule {
    pname = "kube-proxy-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/proxy" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-proxy;
  name = "kube-proxy-fips-1.34-default";
  tag = "v${version}";
  entrypoint = [ "${kube-proxy}/bin/proxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue proxy";
    "org.opencontainers.image.description" = "Kubernetes kube-proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
