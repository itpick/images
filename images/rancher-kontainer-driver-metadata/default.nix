{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-kontainer-driver-metadata
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-kontainer-driver-metadata";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "kontainer-driver-metadata";
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
  name = "rancher-kontainer-driver-metadata";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/kontainer-driver-metadata" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher kontainer driver metadata";
    "org.opencontainers.image.description" = "Rancher rancher-kontainer-driver-metadata";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
