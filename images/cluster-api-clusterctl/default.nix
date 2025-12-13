{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-clusterctl
# Cluster API component

let
  version = "1.9.0";
  component = buildGoModule {
    pname = "cluster-api-clusterctl";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "cluster-api";
      rev = "v${version}";
      hash = "sha256-ENbNgstu+YsNESJ2RsJri3B4zO8UI3Dt60/8AFgsxn8=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "cluster-api-clusterctl";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cluster-api-clusterctl" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster-api-clusterctl";
    "org.opencontainers.image.description" = "Cluster API cluster-api-clusterctl";
    "org.opencontainers.image.version" = version;
  };
}
