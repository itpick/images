{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-redis
# NRI (Node Resource Interface) plugin

let
  version = "1.12.7";
  nri-plugin = buildGoModule {
    pname = "nri-redis";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-redis";
      rev = "v${version}";
      hash = "sha256-GC/yKvOj6+UMMDg3vHLl0jisfrd9ibKK3eawc+xpsCQ=";
    };

    vendorHash = null;
    subPackages = [ "cmd/redis" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-redis";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/redis" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri redis";
    "org.opencontainers.image.description" = "NRI plugin nri-redis";
    "org.opencontainers.image.version" = version;
  };
}
