{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cert-manager-acmesolver-iamguarded
# cert-manager component

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cert-manager-acmesolver-iamguarded";
    inherit version;
    src = fetchFromGitHub {
      owner = "cert-manager";
      repo = "cert-manager";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "cert-manager-acmesolver-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cert-manager-acmesolver-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cert-manager-acmesolver-iamguarded";
    "org.opencontainers.image.description" = "cert-manager cert-manager-acmesolver-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
