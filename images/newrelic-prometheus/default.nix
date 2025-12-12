{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# newrelic-prometheus
# New Relic component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "newrelic-prometheus";
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
  name = "newrelic-prometheus";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/newrelic-prometheus" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "newrelic-prometheus";
    "org.opencontainers.image.description" = "New Relic newrelic-prometheus";
    "org.opencontainers.image.version" = version;
  };
}
