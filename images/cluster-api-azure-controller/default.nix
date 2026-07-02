{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-azure-controller
# Cluster API component

let
  version = "1.9.0";
  cluster-component = buildGoModule {
    pname = "cluster-api-azure-controller";
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
  drv = cluster-component;
  name = "cluster-api-azure-controller";
  tag = "v${version}";
  entrypoint = [ "${cluster-component}/bin/api-azure-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster api azure controller";
    "org.opencontainers.image.description" = "Cluster API cluster-api-azure-controller";
    "org.opencontainers.image.version" = version;
  };
}