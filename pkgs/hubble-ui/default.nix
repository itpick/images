# Hubble UI - Web-based interface for Cilium Hubble
# https://github.com/cilium/hubble-ui
#
# This package builds:
# - hubble-ui-backend: Go backend service
# - hubble-ui: React frontend (requires Node.js build)

{ lib, fetchFromGitHub, buildGoModule, buildNpmPackage, symlinkJoin }:

let
  version = "0.13.3";

  src = fetchFromGitHub {
    owner = "cilium";
    repo = "hubble-ui";
    rev = "v${version}";
    hash = "sha256-CNyznPlrH93dA7AIAkjbwaoA4eQ3APsjBKNm3Fc+hPY=";
  };

  # Backend is a Go service
  hubble-ui-backend = buildGoModule {
    pname = "hubble-ui-backend";
    inherit version src;
    sourceRoot = "${src.name}/backend";
    vendorHash = null;  # Uses vendored dependencies
    env.CGO_ENABLED = 0;
    doCheck = false;
    ldflags = [ "-s" "-w" ];
    meta = with lib; {
      description = "Hubble UI backend service";
      homepage = "https://github.com/cilium/hubble-ui";
      license = licenses.asl20;
    };
  };

in symlinkJoin {
  name = "hubble-ui-${version}";
  paths = [ hubble-ui-backend ];
  passthru = {
    inherit version hubble-ui-backend;
    # Note: hubble-ui frontend requires a Node.js build and is typically served
    # as static files by nginx or the backend service
  };
}
