{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-downscaler
# Kubernetes component

let
  version = "1.34.0";
  kube-downscaler = buildGoModule {
    pname = "kube-downscaler";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/downscaler" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-downscaler;
  name = "kube-downscaler";
  tag = "v${version}";
  entrypoint = [ "${kube-downscaler}/bin/downscaler" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue downscaler";
    "org.opencontainers.image.description" = "Kubernetes kube-downscaler";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
