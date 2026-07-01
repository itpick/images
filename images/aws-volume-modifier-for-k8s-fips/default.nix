{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-volume-modifier-for-k8s-fips
# AWS component

let
  version = "0.9.5";
  component = buildGoModule {
    pname = "aws-volume-modifier-for-k8s-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "awslabs";
      repo = "volume-modifier-for-k8s";
      rev = "v${version}";
      hash = "sha256-1tjBiSCZ0bQ2BXndEXLtRJ3wCDA1p3cMcPpOJwB2Pvo=";
    };
    proxyVendor = true;
    vendorHash = "sha256-qMz6Yv/msKMHjyp/J6FrIV+llS47X/Ad4CFh3L8Sty0=";
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
