{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# newrelic-kubernetes
# New Relic component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "newrelic-kubernetes";
    inherit version;
    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-kubernetes";
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
  name = "newrelic-kubernetes";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/newrelic-kubernetes" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "newrelic-kubernetes";
    "org.opencontainers.image.description" = "New Relic newrelic-kubernetes";
    "org.opencontainers.image.version" = version;
  };
}
