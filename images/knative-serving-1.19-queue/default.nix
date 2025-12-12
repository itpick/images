{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-serving-1.19-queue
# Knative serverless component

let
  version = "1.17.0";
  knative-component = buildGoModule {
    pname = "knative-serving-1.19-queue";
    inherit version;

    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/serving-1.19-queue" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = knative-component;
  name = "knative-serving-1.19-queue";
  tag = "v${version}";
  entrypoint = [ "${knative-component}/bin/serving-1.19-queue" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "knative serving 1.19 queue";
    "org.opencontainers.image.description" = "Knative knative-serving-1.19-queue component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
  };
}
