{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-hardened-kubernetes-compat-fips
# Rancher component

let
  version = "2.10.0";
  component = buildGoModule {
    pname = "rancher-hardened-kubernetes-compat-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "rancher";
      repo = "rancher";
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
  name = "rancher-hardened-kubernetes-compat-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/rancher-hardened-kubernetes-compat" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "rancher-hardened-kubernetes-compat-fips";
    "org.opencontainers.image.description" = "Rancher rancher-hardened-kubernetes-compat";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
