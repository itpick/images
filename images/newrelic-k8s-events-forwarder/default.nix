{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# newrelic-k8s-events-forwarder
# New Relic component

let
  version = "3.51.1";
  component = buildGoModule {
    pname = "newrelic-k8s-events-forwarder";
    inherit version;
    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-kubernetes";
      rev = "v${version}";
      hash = "sha256-5eInOp36Te266UiCfGTIk8qVZodZt3J0N/Xs+leiUzY=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "newrelic-k8s-events-forwarder";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/newrelic-k8s-events-forwarder" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "newrelic-k8s-events-forwarder";
    "org.opencontainers.image.description" = "New Relic newrelic-k8s-events-forwarder";
    "org.opencontainers.image.version" = version;
  };
}
