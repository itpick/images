{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-cli-fips
# Kyverno policy engine

let
  version = "1.13.0";
  component = buildGoModule {
    pname = "kyverno-cli-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
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
  name = "kyverno-cli-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kyverno-cli" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno-cli-fips";
    "org.opencontainers.image.description" = "Kyverno kyverno-cli";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
