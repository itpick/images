{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-f5-fips
# NRI (Node Resource Interface) plugin

let
  version = "2.9.2";
  nri-plugin = buildGoModule {
    pname = "nri-f5-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-f5";
      rev = "v${version}";
      hash = "sha256-sH/zq/FZXMMwspiDS0czhceNjSCJmTzL+eqf1xEkYfI=";
    };

    vendorHash = null;
    subPackages = [ "cmd/f5" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-f5-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/f5" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri f5";
    "org.opencontainers.image.description" = "NRI plugin nri-f5";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
