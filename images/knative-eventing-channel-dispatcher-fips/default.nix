{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-eventing-channel-dispatcher-fips
# Knative serverless component

let
  version = "1.17.0";
  component = buildGoModule {
    pname = "knative-eventing-channel-dispatcher-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "knative-eventing-channel-dispatcher-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/knative-eventing-channel-dispatcher" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "knative-eventing-channel-dispatcher-fips";
    "org.opencontainers.image.description" = "Knative knative-eventing-channel-dispatcher";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
