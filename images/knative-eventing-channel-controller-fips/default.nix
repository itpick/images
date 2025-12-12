{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-eventing-channel-controller-fips
# Knative serverless component

let
  version = "1.17.0";
  component = buildGoModule {
    pname = "knative-eventing-channel-controller-fips";
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
  name = "knative-eventing-channel-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/knative-eventing-channel-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "knative-eventing-channel-controller-fips";
    "org.opencontainers.image.description" = "Knative knative-eventing-channel-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
