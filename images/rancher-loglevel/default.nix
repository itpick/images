{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-loglevel
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-loglevel";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "loglevel";
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
  name = "rancher-loglevel";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/loglevel" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher loglevel";
    "org.opencontainers.image.description" = "Rancher rancher-loglevel";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
