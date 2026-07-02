{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-aws-controller
# Cluster API component

let
  version = "1.9.0";
  cluster-component = buildGoModule {
    pname = "cluster-api-aws-controller";
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
  name = "cluster-api-aws-controller";
  tag = "v${version}";
  entrypoint = [ "${cluster-component}/bin/api-aws-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster api aws controller";
    "org.opencontainers.image.description" = "Cluster API cluster-api-aws-controller";
    "org.opencontainers.image.version" = version;
  };
}