{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-policy-reporter-ui
# Kyverno policy engine component

let
  version = "1.14.0";
  kyverno-component = buildGoModule {
    pname = "kyverno-policy-reporter-ui";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-frLuq91CWjyNSj5HFvYIsyR6NFvZqXLil3YQL5Tli6o=";
    };
    vendorHash = null;
    subPackages = [ "cmd/policy-reporter-ui" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kyverno-component;
  name = "kyverno-policy-reporter-ui";
  tag = "v${version}";
  entrypoint = [ "${kyverno-component}/bin/policy-reporter-ui" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno policy reporter ui";
    "org.opencontainers.image.description" = "Kyverno kyverno-policy-reporter-ui";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
