{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-policy-reporter-plugins-trivy
# Kyverno policy engine component

let
  version = "1.14.0";
  kyverno-component = buildGoModule {
    pname = "kyverno-policy-reporter-plugins-trivy";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/policy-reporter-plugins-trivy" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kyverno-component;
  name = "kyverno-policy-reporter-plugins-trivy";
  tag = "v${version}";
  entrypoint = [ "${kyverno-component}/bin/policy-reporter-plugins-trivy" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno policy reporter plugins trivy";
    "org.opencontainers.image.description" = "Kyverno kyverno-policy-reporter-plugins-trivy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
