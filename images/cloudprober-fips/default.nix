{ mkImage, pkgs, lib, ... }:

# cloudprober-fips
# Container image packaging nixpkgs.cloudprober
mkImage {
  drv = pkgs.cloudprober;
  name = "cloudprober-fips";
  tag = "v${pkgs.cloudprober.version}";
  entrypoint = [ (lib.getExe pkgs.cloudprober) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cloudprober-fips";
    "org.opencontainers.image.description" = "cloudprober-fips container image (nixpkgs.cloudprober)";
    "org.opencontainers.image.version" = pkgs.cloudprober.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
