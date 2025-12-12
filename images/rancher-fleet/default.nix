{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-fleet
# Rancher component

let
  version = "2.10.0";
  component = buildGoModule {
    pname = "rancher-fleet";
    inherit version;
    src = fetchFromGitHub {
      owner = "rancher";
      repo = "rancher";
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
  name = "rancher-fleet";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/rancher-fleet" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "rancher-fleet";
    "org.opencontainers.image.description" = "Rancher rancher-fleet";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
