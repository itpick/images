{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# newrelic-kube-events
# New Relic component

let
  version = "3.51.1";
  component = buildGoModule {
    pname = "newrelic-kube-events";
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
  name = "newrelic-kube-events";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/newrelic-kube-events" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "newrelic-kube-events";
    "org.opencontainers.image.description" = "New Relic newrelic-kube-events";
    "org.opencontainers.image.version" = version;
  };
}
