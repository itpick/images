{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-arangodb-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-arangodb = buildGoModule {
    pname = "kube-arangodb-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/arangodb" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-arangodb;
  name = "kube-arangodb-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-arangodb}/bin/arangodb" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue arangodb";
    "org.opencontainers.image.description" = "Kubernetes kube-arangodb";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
