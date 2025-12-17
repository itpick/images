{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubeflow-volumes-web-app-fips
# Kubeflow ML platform component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "kubeflow-volumes-web-app-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "kubeflow";
      rev = "v${version}";
      hash = "sha256-R3WJ7K+0rHklOxV6kg9QZRV5OipG3qYjZ2XC4Njd8Y0=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "kubeflow-volumes-web-app-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubeflow-volumes-web-app" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubeflow-volumes-web-app-fips";
    "org.opencontainers.image.description" = "Kubeflow kubeflow-volumes-web-app";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubeflow";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
