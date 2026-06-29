{ mkImage, pkgs, lib, ... }:

# ruby-fips
# Container image packaging nixpkgs.ruby
mkImage {
  drv = pkgs.ruby;
  name = "ruby-fips";
  tag = "v${pkgs.ruby.version}";
  entrypoint = [ (lib.getExe pkgs.ruby) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ruby-fips";
    "org.opencontainers.image.description" = "ruby-fips container image (nixpkgs.ruby)";
    "org.opencontainers.image.version" = pkgs.ruby.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
