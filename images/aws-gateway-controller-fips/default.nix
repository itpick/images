{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-gateway-controller-fips
# AWS component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "aws-gateway-controller-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-application-networking-k8s";
      rev = "v${version}";
      hash = "sha256-YtDZyjgtgYOAkdND7BUc70F5Z+Gw9fii7+ZMR5SB910=";
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
  name = "aws-gateway-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-gateway-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-gateway-controller-fips";
    "org.opencontainers.image.description" = "AWS aws-gateway-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
