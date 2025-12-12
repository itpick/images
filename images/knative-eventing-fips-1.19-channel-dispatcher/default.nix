{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# knative-eventing-fips-1.19-channel-dispatcher-fips
# Knative serverless component

let
  version = "1.17.0";
  knative-component = buildGoModule {
    pname = "knative-eventing-fips-1.19-channel-dispatcher";
    inherit version;

    src = fetchFromGitHub {
      owner = "knative";
      repo = "serving";
      rev = "knative-v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/eventing-fips-1.19-channel-dispatcher" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = knative-component;
  name = "knative-eventing-fips-1.19-channel-dispatcher";
  tag = "v${version}";
  entrypoint = [ "${knative-component}/bin/eventing-fips-1.19-channel-dispatcher" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "knative eventing fips 1.19 channel dispatcher";
    "org.opencontainers.image.description" = "Knative knative-eventing-fips-1.19-channel-dispatcher component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "knative";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
