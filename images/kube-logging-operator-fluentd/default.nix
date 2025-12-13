{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-logging-operator-fluentd
# Kubernetes component

let
  version = "1.32.0";
  component = buildGoModule {
    pname = "kube-logging-operator-fluentd";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "kube-logging-operator-fluentd";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kube-logging-operator-fluentd" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kube-logging-operator-fluentd";
    "org.opencontainers.image.description" = "Kubernetes kube-logging-operator-fluentd";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
