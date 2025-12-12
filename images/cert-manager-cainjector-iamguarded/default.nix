{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cert-manager-cainjector-iamguarded
# cert-manager component

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cert-manager-cainjector-iamguarded";
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
  name = "cert-manager-cainjector-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cert-manager-cainjector-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cert-manager-cainjector-iamguarded";
    "org.opencontainers.image.description" = "cert-manager cert-manager-cainjector-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
