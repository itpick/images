{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-fleet-fips
# Rancher component

let
  version = "0.12.10";
  component = buildGoModule {
    pname = "rancher-fleet-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "rancher";
      repo = "fleet";
      rev = "v${version}";
      hash = "sha256-Z16MI+KVn+nwmoWvlUggbgFQKUoAc7Sxkpiydq3JFdU=";
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
  name = "rancher-fleet-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/rancher-fleet" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "rancher-fleet-fips";
    "org.opencontainers.image.description" = "Rancher rancher-fleet";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}