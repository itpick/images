{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-pipelines-scheduledworkflow
# Kubeflow ML platform component

let
  version = "1.9.0";
  kubeflow-component = buildGoModule {
    pname = "kubeflow-pipelines-scheduledworkflow";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "pipelines";
      rev = "${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kubeflow-component;
  name = "kubeflow-pipelines-scheduledworkflow";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-component}/bin/pipelines-scheduledworkflow" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow pipelines scheduledworkflow";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-pipelines-scheduledworkflow";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
