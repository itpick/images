{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Function - auto-ready
# https://github.com/crossplane-contrib/function-auto-ready

let
  version = "0.1.0";
  function-auto-ready = buildGoModule {
    pname = "function-auto-ready";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "function-auto-ready";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane function for auto-ready";
      homepage = "https://github.com/crossplane-contrib/function-auto-ready";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = function-auto-ready;
  name = "crossplane-function-auto-ready";
  tag = "v${version}";
  entrypoint = [ "${function-auto-ready}/bin/function-auto-ready" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Function auto ready";
    "org.opencontainers.image.description" = "Crossplane function for auto-ready";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
