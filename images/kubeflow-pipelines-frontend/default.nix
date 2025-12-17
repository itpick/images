{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-pipelines-frontend
# Kubeflow ML platform component

let
  version = "1.9.0";
  kubeflow-component = buildGoModule {
    pname = "kubeflow-pipelines-frontend";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "kubeflow";
      rev = "v${version}";
      hash = "sha256-R3WJ7K+0rHklOxV6kg9QZRV5OipG3qYjZ2XC4Njd8Y0=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kubeflow-component;
  name = "kubeflow-pipelines-frontend";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-component}/bin/pipelines-frontend" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow pipelines frontend";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-pipelines-frontend";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
