{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-machine
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-machine";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "machine";
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
  name = "rancher-machine";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/machine" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher machine";
    "org.opencontainers.image.description" = "Rancher rancher-machine";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
