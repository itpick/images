{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-katib-earlystopping-medianstop
# Kubeflow ML platform component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "kubeflow-katib-earlystopping-medianstop";
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
  name = "kubeflow-katib-earlystopping-medianstop";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubeflow-katib-earlystopping-medianstop" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow-katib-earlystopping-medianstop";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-katib-earlystopping-medianstop";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
