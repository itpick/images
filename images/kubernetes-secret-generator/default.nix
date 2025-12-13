{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-secret-generator
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-secret-generator = buildGoModule {
    pname = "kubernetes-secret-generator";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/secret-generator" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-secret-generator;
  name = "kubernetes-secret-generator";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-secret-generator}/bin/secret-generator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes secret generator";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-secret-generator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
