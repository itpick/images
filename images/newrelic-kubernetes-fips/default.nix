{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# newrelic-kubernetes-fips
# New Relic component

let
  version = "3.51.1";
  component = buildGoModule {
    pname = "newrelic-kubernetes-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-kubernetes";
      rev = "v${version}";
      hash = "sha256-5eInOp36Te266UiCfGTIk8qVZodZt3J0N/Xs+leiUzY=";
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
  name = "newrelic-kubernetes-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/newrelic-kubernetes" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "newrelic-kubernetes-fips";
    "org.opencontainers.image.description" = "New Relic newrelic-kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
