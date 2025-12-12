{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-fleet-cli
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-fleet-cli";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "fleet-cli";
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
  name = "rancher-fleet-cli";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/fleet-cli" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher fleet cli";
    "org.opencontainers.image.description" = "Rancher rancher-fleet-cli";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
