{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-serving-controller
# Knative serverless component

let
  version = "1.17.0";
  component = buildGoModule {
    pname = "knative-serving-controller";
    inherit version;
    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
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
  name = "knative-serving-controller";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/knative-serving-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "knative-serving-controller";
    "org.opencontainers.image.description" = "Knative knative-serving-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
  };
}
