{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-notation-aws
# Kyverno policy engine component

let
  version = "1.14.0";
  kyverno-component = buildGoModule {
    pname = "kyverno-notation-aws";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/notation-aws" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kyverno-component;
  name = "kyverno-notation-aws";
  tag = "v${version}";
  entrypoint = [ "${kyverno-component}/bin/notation-aws" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno notation aws";
    "org.opencontainers.image.description" = "Kyverno kyverno-notation-aws";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
