{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-volume-modifier-for-k8s-fips
# AWS component

let
  version = "0.9.1";
  component = buildGoModule {
    pname = "aws-volume-modifier-for-k8s-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "awslabs";
      repo = "volume-modifier-for-k8s";
      rev = "v${version}";
      hash = "sha256-/66Pt6y7lvLFkbG9HNWRR/evUiqE10INp6l5iLJuKMk=";
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
  name = "aws-volume-modifier-for-k8s-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-volume-modifier-for-k8s" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-volume-modifier-for-k8s-fips";
    "org.opencontainers.image.description" = "AWS aws-volume-modifier-for-k8s";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
