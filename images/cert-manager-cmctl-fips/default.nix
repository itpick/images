{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cert-manager-cmctl-fips
# cert-manager component

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cert-manager-cmctl-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "cert-manager";
      repo = "cert-manager";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
  name = "cert-manager-cmctl-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cert-manager-cmctl" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cert-manager-cmctl-fips";
    "org.opencontainers.image.description" = "cert-manager cert-manager-cmctl";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
