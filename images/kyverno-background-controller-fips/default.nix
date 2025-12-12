{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kyverno-background-controller-fips
# Kyverno policy engine component

let
  version = "1.14.0";
  kyverno-component = buildGoModule {
    pname = "kyverno-background-controller-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/background-controller" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = kyverno-component;
  name = "kyverno-background-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${kyverno-component}/bin/background-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "kyverno background controller";
    "org.opencontainers.image.description" = "Kyverno kyverno-background-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
