{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-policy-reporter-plugin
# Kyverno policy engine

let
  version = "1.13.0";
  component = buildGoModule {
    pname = "kyverno-policy-reporter-plugin";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "kyverno-policy-reporter-plugin";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kyverno-policy-reporter-plugin" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno-policy-reporter-plugin";
    "org.opencontainers.image.description" = "Kyverno kyverno-policy-reporter-plugin";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
