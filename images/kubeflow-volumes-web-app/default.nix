{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-volumes-web-app
# Kubeflow ML platform component

let
  version = "1.9.0";
  kubeflow-component = buildGoModule {
    pname = "kubeflow-volumes-web-app";
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
  name = "kubeflow-volumes-web-app";
  tag = "v${version}";
  entrypoint = [ "${kubeflow-component}/bin/volumes-web-app" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow volumes web app";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-volumes-web-app";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
  };
}
