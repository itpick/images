{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-policy-reporter-plugins-kyverno-fips
# Kyverno policy engine component

let
  version = "1.14.0";
  kyverno-component = buildGoModule {
    pname = "kyverno-policy-reporter-plugins-kyverno-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-frLuq91CWjyNSj5HFvYIsyR6NFvZqXLil3YQL5Tli6o=";
    };
    vendorHash = null;
    subPackages = [ "cmd/policy-reporter-plugins-kyverno" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kyverno-component;
  name = "kyverno-policy-reporter-plugins-kyverno-fips";
  tag = "v${version}";
  entrypoint = [ "${kyverno-component}/bin/policy-reporter-plugins-kyverno" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno policy reporter plugins kyverno";
    "org.opencontainers.image.description" = "Kyverno kyverno-policy-reporter-plugins-kyverno";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
