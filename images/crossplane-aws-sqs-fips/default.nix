{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-aws-sqs-fips
# Crossplane provider/component

let
  version = "0.58.0";
  component = buildGoModule {
    pname = "crossplane-aws-sqs-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws";
      rev = "v${version}";
      hash = "sha256-z1ZqesqvW6VLgnxfqnlccJ0HqNqA3zd0vGvnxtUgkPI=";
    };
    vendorHash = "sha256-dNA0DOQjL9tp/RSgo2wmFghxjDMybeMLtglJTLYyM8A=";
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-aws-sqs-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-aws-sqs-fips";
    "org.opencontainers.image.description" = "Crossplane crossplane-aws-sqs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
