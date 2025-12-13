{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-logging-operator-custom-runner-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-logging-operator-custom-runner = buildGoModule {
    pname = "kube-logging-operator-custom-runner-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/logging-operator-custom-runner" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-logging-operator-custom-runner;
  name = "kube-logging-operator-custom-runner-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-logging-operator-custom-runner}/bin/logging-operator-custom-runner" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue logging operator custom runner";
    "org.opencontainers.image.description" = "Kubernetes kube-logging-operator-custom-runner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
