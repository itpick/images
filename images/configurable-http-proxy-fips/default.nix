{ mkImage, pkgs, lib, ... }:

# configurable-http-proxy-fips
# Container image packaging nixpkgs.configurable-http-proxy
mkImage {
  drv = pkgs.configurable-http-proxy;
  name = "configurable-http-proxy-fips";
  tag = "v${pkgs.configurable-http-proxy.version}";
  entrypoint = [ (lib.getExe pkgs.configurable-http-proxy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "configurable-http-proxy-fips";
    "org.opencontainers.image.description" = "configurable-http-proxy-fips container image (nixpkgs.configurable-http-proxy)";
    "org.opencontainers.image.version" = pkgs.configurable-http-proxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
