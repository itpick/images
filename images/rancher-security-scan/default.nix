{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# rancher-security-scan
# Rancher component

let
  version = "0.7.5";
  rancher-component = buildGoModule {
    pname = "rancher-security-scan";
    inherit version;

    src = fetchFromGitHub {
      owner = "rancher";
      repo = "security-scan";
      rev = "v${version}";
      hash = "sha256-Ug/BF17+U2VBM8O95P4OZ+X0OEnCqyI+6+s3Uw39bZI=";
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
