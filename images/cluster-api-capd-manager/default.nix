{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-capd-manager
# Cluster API component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "cluster-api-capd-manager";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "cluster-api";
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
  name = "cluster-api-capd-manager";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cluster-api-capd-manager" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster-api-capd-manager";
    "org.opencontainers.image.description" = "Cluster API cluster-api-capd-manager";
    "org.opencontainers.image.version" = version;
  };
}
