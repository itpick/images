{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Function - environment-configs
# https://github.com/crossplane-contrib/function-environment-configs

let
  version = "0.1.0";
  function-environment-configs = buildGoModule {
    pname = "function-environment-configs";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "function-environment-configs";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane function for environment-configs";
      homepage = "https://github.com/crossplane-contrib/function-environment-configs";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = function-environment-configs;
  name = "crossplane-function-environment-configs";
  tag = "v${version}";
  entrypoint = [ "${function-environment-configs}/bin/function-environment-configs" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Function environment configs";
    "org.opencontainers.image.description" = "Crossplane function for environment-configs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
