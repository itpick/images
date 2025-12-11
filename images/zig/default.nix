{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.zig;
  name = "zig";
  tag = "v${pkgs.zig.version}";
  entrypoint = [ "${pkgs.zig}/bin/zig" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Zig";
    "org.opencontainers.image.description" = "General-purpose programming language and target platform";
    "org.opencontainers.image.version" = pkgs.zig.version;
    "io.nix-containers.chart" = "zig";
  };
}
