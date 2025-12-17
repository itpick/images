{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gitlab
# https://github.com/crossplane-contrib/provider-gitlab

let
  version = "0.1.0";
  provider-gitlab = buildGoModule {
    pname = "provider-gitlab";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gitlab";
      rev = "v${version}";
      hash = "sha256-moluGWbxFW+2Uq29jgL0w+f7fp0NLbJ4CDzmiojIbpg=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for gitlab";
      homepage = "https://github.com/crossplane-contrib/provider-gitlab";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gitlab;
  name = "crossplane-provider-gitlab";
  tag = "v${version}";
  entrypoint = [ "${provider-gitlab}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gitlab";
    "org.opencontainers.image.description" = "Crossplane provider for gitlab";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
