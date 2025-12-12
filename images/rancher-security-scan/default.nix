{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-security-scan
# Rancher component

let
  version = "2.10.0";
  rancher-component = buildGoModule {
    pname = "rancher-security-scan";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "security-scan";
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
  name = "rancher-security-scan";
  tag = "v${version}";
  entrypoint = [ "${rancher-component}/bin/security-scan" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "rancher security scan";
    "org.opencontainers.image.description" = "Rancher rancher-security-scan";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rancher";
  };
}
