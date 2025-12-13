{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-fluentd-operator
# Kubernetes component

let
  version = "1.34.0";
  kube-fluentd-operator = buildGoModule {
    pname = "kube-fluentd-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/fluentd-operator" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-fluentd-operator;
  name = "kube-fluentd-operator";
  tag = "v${version}";
  entrypoint = [ "${kube-fluentd-operator}/bin/fluentd-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue fluentd operator";
    "org.opencontainers.image.description" = "Kubernetes kube-fluentd-operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
