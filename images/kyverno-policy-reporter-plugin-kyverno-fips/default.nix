{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-policy-reporter-plugin-kyverno-fips
# Kyverno policy engine

let
  version = "1.13.0";
  component = buildGoModule {
    pname = "kyverno-policy-reporter-plugin-kyverno-fips";
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
  name = "kyverno-policy-reporter-plugin-kyverno-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kyverno-policy-reporter-plugin-kyverno" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno-policy-reporter-plugin-kyverno-fips";
    "org.opencontainers.image.description" = "Kyverno kyverno-policy-reporter-plugin-kyverno";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
