{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for age:
# Packages available in nixpkgs:
#   pkgs.age  # Modern encryption tool with small explicit keys

mkImage {
  drv = pkgs.age;
  name = "age";
  tag = "v${pkgs.age.version}";
  entrypoint = [ "${pkgs.age}/bin/age" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "age";
    "org.opencontainers.image.description" = "Modern encryption tool with small explicit keys";
    "org.opencontainers.image.version" = pkgs.age.version;
    "io.nix-containers.chart" = "age";
  };
}
