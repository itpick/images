{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-webhook-fips
# Rancher component

let
  version = "0.9.1";
  rancher-component = buildGoModule {
    pname = "rancher-webhook-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "webhook";
      rev = "v${version}";
      hash = "sha256-WpZjAmAe+NBCvG80el0iipYAXXvxU9SIg8qTx9NxyEg=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = rancher-component;
  name = "rancher-webhook-fips";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/webhook" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher weuhook";
    "org.opencontainers.image.description" = "Rancher rancher-webhook";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
