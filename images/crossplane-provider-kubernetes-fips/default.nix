{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - kubernetes
# https://github.com/crossplane-contrib/provider-kubernetes

let
  version = "0.1.0";
  provider-kubernetes = buildGoModule {
    pname = "provider-kubernetes-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-kubernetes";
      rev = "v${version}";
      hash = "sha256-Rb+plMyBivFNCKJSUnkLkV5vmH+pbIGsI2RjQ9HTnQg=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for kubernetes";
      homepage = "https://github.com/crossplane-contrib/provider-kubernetes";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-kubernetes;
  name = "crossplane-provider-kubernetes-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-kubernetes}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider kuuernetes";
    "org.opencontainers.image.description" = "Crossplane provider for kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
