{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-keycloak
# Crossplane provider/component

let
  version = "2.21.1";
  component = buildGoModule {
    pname = "crossplane-keycloak";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-keycloak";
      rev = "v${version}";
      hash = "sha256-3dR/P94XPLv9YaksqT3W63orOBSw3o5hbM2vMvXFhP0=";
    };
    vendorHash = "sha256-4VTsvmkdTJzeJQWNWfL3BbN+wl7zrH/i8dIeESFnRKQ=";
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-keycloak";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-keycloak";
    "org.opencontainers.image.description" = "Crossplane crossplane-keycloak";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
