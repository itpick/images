{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-policy-reporter-plugins-kyverno
# Kyverno policy engine component

let
  version = "1.14.0";
  kyverno-component = buildGoModule {
    pname = "kyverno-policy-reporter-plugins-kyverno";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/policy-reporter-plugins-kyverno" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kyverno-component;
  name = "kyverno-policy-reporter-plugins-kyverno";
  tag = "v${version}";
  entrypoint = [ "${kyverno-component}/bin/policy-reporter-plugins-kyverno" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno policy reporter plugins kyverno";
    "org.opencontainers.image.description" = "Kyverno kyverno-policy-reporter-plugins-kyverno";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
