{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gcp-pubsub
# https://github.com/crossplane-contrib/provider-gcp-pubsub

let
  version = "0.1.0";
  provider-gcp-pubsub = buildGoModule {
    pname = "provider-gcp-pubsub";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp-pubsub";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for gcp-pubsub";
      homepage = "https://github.com/crossplane-contrib/provider-gcp-pubsub";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp-pubsub;
  name = "crossplane-provider-gcp-pubsub";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp-pubsub}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gcp puusub";
    "org.opencontainers.image.description" = "Crossplane provider for gcp-pubsub";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
