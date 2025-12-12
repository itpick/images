{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-release-go-runner
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-release-go-runner = buildGoModule {
    pname = "kubernetes-release-go-runner";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/release-go-runner" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-release-go-runner;
  name = "kubernetes-release-go-runner";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-release-go-runner}/bin/release-go-runner" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes release go runner";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-release-go-runner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
