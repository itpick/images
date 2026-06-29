{ mkImage, pkgs, lib, ... }:

# erlang-fips
# Container image packaging nixpkgs.erlang
mkImage {
  drv = pkgs.erlang;
  name = "erlang-fips";
  tag = "v${pkgs.erlang.version}";
  entrypoint = [ (lib.getExe pkgs.erlang) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "erlang-fips";
    "org.opencontainers.image.description" = "erlang-fips container image (nixpkgs.erlang)";
    "org.opencontainers.image.version" = pkgs.erlang.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
