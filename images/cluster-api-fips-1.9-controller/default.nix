{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cluster-api-fips-1.9-controller-fips
# Cluster API component

let
  version = "1.9.0";
  cluster-component = buildGoModule {
    pname = "cluster-api-fips-1.9-controller";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "cluster-api";
      rev = "v${version}";
      hash = "sha256-ENbNgstu+YsNESJ2RsJri3B4zO8UI3Dt60/8AFgsxn8=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = cluster-component;
  name = "cluster-api-fips-1.9-controller";
  tag = "v${version}";
  entrypoint = [ "${cluster-component}/bin/api-fips-1.9-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cluster api fips 1.9 controller";
    "org.opencontainers.image.description" = "Cluster API cluster-api-fips-1.9-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}