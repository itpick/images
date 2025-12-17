{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-katib-suggestion-skopt
# Kubeflow ML platform component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "kubeflow-katib-suggestion-skopt";
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
  drv = component;
  name = "kubeflow-katib-suggestion-skopt";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubeflow-katib-suggestion-skopt" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow-katib-suggestion-skopt";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-katib-suggestion-skopt";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
