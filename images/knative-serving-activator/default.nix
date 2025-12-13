{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-serving-activator
# Knative serverless component

let
  version = "1.17.0";
  component = buildGoModule {
    pname = "knative-serving-activator";
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
  name = "knative-serving-activator";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/knative-serving-activator" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "knative-serving-activator";
    "org.opencontainers.image.description" = "Knative knative-serving-activator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
  };
}
