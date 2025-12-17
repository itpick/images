{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-haproxy-fips
# NRI (Node Resource Interface) plugin

let
  version = "3.2.4";
  nri-plugin = buildGoModule {
    pname = "nri-haproxy-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-haproxy";
      rev = "v${version}";
      hash = "sha256-W+BoF9/9XfXhL+wgia3BHYePfxjJ2z9Kxt8/jlMIT64=";
    };

    vendorHash = null;
    subPackages = [ "cmd/haproxy" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-haproxy-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/haproxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri haproxy";
    "org.opencontainers.image.description" = "NRI plugin nri-haproxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
