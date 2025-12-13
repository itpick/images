{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-operator-webhook
# Knative serverless component

let
  version = "1.17.0";
  component = buildGoModule {
    pname = "knative-operator-webhook";
    inherit version;
    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
      hash = "sha256-cLr2T9FGLGistXpMbo2Nyjw9soJ7DXcNFLw5BaAYiEc=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "knative-operator-webhook";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/knative-operator-webhook" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "knative-operator-webhook";
    "org.opencontainers.image.description" = "Knative knative-operator-webhook";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
  };
}
