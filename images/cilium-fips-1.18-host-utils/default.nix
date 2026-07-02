{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cilium-fips-1.18-host-utils-fips
# Cilium networking component

let
  version = "1.19.5";
  cilium-component = buildGoModule {
    pname = "cilium-fips-1.18-host-utils";
    inherit version;
    src = fetchFromGitHub {
      owner = "cilium";
      repo = "cilium";
      rev = "v${version}";
      hash = "sha256-0/GlsmRG6YuHJ8ROoVrCiksFf1+wokxUEzO6V6gvme4=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = cilium-component;
  name = "cilium-fips-1.18-host-utils";
  tag = "v${version}";
  entrypoint = [ "${cilium-component}/bin/fips-1.18-host-utils" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert iptables ];
  labels = {
    "org.opencontainers.image.title" = "cilium fips 1.18 host utils";
    "org.opencontainers.image.description" = "Cilium cilium-fips-1.18-host-utils";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cilium";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
