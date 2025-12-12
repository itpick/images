{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-notebook-controller
# Kubeflow ML platform component

let
  version = "1.9.0";
  kubeflow-component = buildGoModule {
    pname = "kubeflow-notebook-controller";
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
  name = "kubeflow-notebook-controller";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-component}/bin/notebook-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow notebook controller";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-notebook-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
