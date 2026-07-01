{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-aws-rds
# Crossplane provider/component

let
  version = "0.58.0";
  component = buildGoModule {
    pname = "crossplane-aws-rds";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws";
      rev = "v${version}";
      hash = "sha256-z1ZqesqvW6VLgnxfqnlccJ0HqNqA3zd0vGvnxtUgkPI=";
    };
    vendorHash = "sha256-dNA0DOQjL9tp/RSgo2wmFghxjDMybeMLtglJTLYyM8A=";
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-aws-rds";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-aws-rds";
    "org.opencontainers.image.description" = "Crossplane crossplane-aws-rds";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
