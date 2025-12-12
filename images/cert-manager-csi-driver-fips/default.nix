{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cert-manager-csi-driver-fips
# cert-manager component

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cert-manager-csi-driver-fips";
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
  name = "cert-manager-csi-driver-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cert-manager-csi-driver" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cert-manager-csi-driver-fips";
    "org.opencontainers.image.description" = "cert-manager cert-manager-csi-driver";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
