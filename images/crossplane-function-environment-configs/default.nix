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
      hash = "sha256-cIX9PQRzn8jhEv7gfpos9k4vEbvnbdSxPP8xwfFdpMk=";
    };

    vendorHash = "sha256-u3XxEzwDAFJV2g/oAm+F8yR+0TeIWF3oR/DnYxhGNj0=";

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
