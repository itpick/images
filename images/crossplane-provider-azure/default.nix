# crossplane-provider-azure
# =============
# Crossplane Azure Provider - Manage Azure resources via Crossplane
# https://github.com/crossplane-contrib/provider-azure

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

let
  version = "0.20.1";
  provider-azure = buildGoModule {
    pname = "provider-azure";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-azure";
      rev = "v${version}";
      hash = "sha256-qg+6pIWsRpO0mXjdzn4JtcHD97y7C2pKgnwqvBxc2IU=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/crossplane-contrib/provider-azure/internal/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Crossplane Azure Provider for managing Azure resources";
      homepage = "https://github.com/crossplane-contrib/provider-azure";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-azure;
  name = "crossplane-provider-azure";
  tag = "v${version}";
  entrypoint = [ "${provider-azure}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider Azure";
    "org.opencontainers.image.description" = "Crossplane Azure Provider for managing Azure resources";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
