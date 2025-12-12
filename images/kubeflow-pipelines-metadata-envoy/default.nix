{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-pipelines-metadata-envoy
# Kubeflow ML platform component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "kubeflow-pipelines-metadata-envoy";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "pipelines";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "kubeflow-pipelines-metadata-envoy";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubeflow-pipelines-metadata-envoy" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow-pipelines-metadata-envoy";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-pipelines-metadata-envoy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
