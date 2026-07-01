{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-gateway-controller
# AWS component

let
  version = "2.1.1";
  component = buildGoModule {
    pname = "aws-gateway-controller";
    inherit version;
    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-application-networking-k8s";
      rev = "v${version}";
      hash = "sha256-czBM1FeXWeDL1DtlkAViL/kMk4fanflVosVlMMNFJ40=";
    };
    vendorHash = "sha256-7YA7cK83/SrE0no+jvXGOCXPudQFOrYsm4oOhS00Fjk=";
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "aws-gateway-controller";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-gateway-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-gateway-controller";
    "org.opencontainers.image.description" = "AWS aws-gateway-controller";
    "org.opencontainers.image.version" = version;
  };
}
