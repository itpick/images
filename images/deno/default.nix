{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.deno;
  name = "deno";
  tag = "v${pkgs.deno.version}";
  entrypoint = [ "${pkgs.deno}/bin/deno" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ cacert ];

  env = {
    DENO_DIR = "/deno-dir";
  };

  labels = {
    "org.opencontainers.image.title" = "Deno";
    "org.opencontainers.image.description" = "Secure runtime for JavaScript and TypeScript";
    "org.opencontainers.image.version" = pkgs.deno.version;
    "io.nix-containers.chart" = "deno";
  };
}
