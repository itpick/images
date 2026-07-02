{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Function - go-templating
# https://github.com/crossplane-contrib/function-go-templating

let
  version = "0.1.0";
  function-go-templating = buildGoModule {
    pname = "function-go-templating";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "function-go-templating";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane function for go-templating";
      homepage = "https://github.com/crossplane-contrib/function-go-templating";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = function-go-templating;
  name = "crossplane-function-go-templating";
  tag = "v${version}";
  entrypoint = [ "${function-go-templating}/bin/function-go-templating" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Function go templating";
    "org.opencontainers.image.description" = "Crossplane function for go-templating";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}