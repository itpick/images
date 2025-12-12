{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-admission-webhook
# Kubeflow ML platform component

let
  version = "1.9.0";
  kubeflow-component = buildGoModule {
    pname = "kubeflow-admission-webhook";
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
  name = "kubeflow-admission-webhook";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-component}/bin/admission-webhook" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow admission webhook";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-admission-webhook";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
