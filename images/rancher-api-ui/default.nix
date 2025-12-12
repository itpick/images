{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-api-ui
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-api-ui";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "api-ui";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = rancher-component;
  name = "rancher-api-ui";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/api-ui" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher api ui";
    "org.opencontainers.image.description" = "Rancher rancher-api-ui";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
