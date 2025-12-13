{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-bench-configs
# Kubernetes component

let
  version = "1.34.0";
  kube-bench-configs = buildGoModule {
    pname = "kube-bench-configs";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/bench-configs" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-bench-configs;
  name = "kube-bench-configs";
  tag = "v${version}";
  entrypoint = [ "${kube-bench-configs}/bin/bench-configs" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue uench configs";
    "org.opencontainers.image.description" = "Kubernetes kube-bench-configs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
