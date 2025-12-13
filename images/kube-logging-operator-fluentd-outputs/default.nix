{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-logging-operator-fluentd-outputs
# Kubernetes component

let
  version = "1.34.0";
  kube-logging-operator-fluentd-outputs = buildGoModule {
    pname = "kube-logging-operator-fluentd-outputs";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/logging-operator-fluentd-outputs" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-logging-operator-fluentd-outputs;
  name = "kube-logging-operator-fluentd-outputs";
  tag = "v${version}";
  entrypoint = [ "${kube-logging-operator-fluentd-outputs}/bin/logging-operator-fluentd-outputs" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue logging operator fluentd outputs";
    "org.opencontainers.image.description" = "Kubernetes kube-logging-operator-fluentd-outputs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
