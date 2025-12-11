{ mkImage, pkgs, lib, ... }:

# Elixir - Functional programming language
# https://elixir-lang.org/

mkImage {
  drv = pkgs.elixir;
  name = "elixir";
  tag = "v${pkgs.elixir.version}";
  entrypoint = [ "${pkgs.elixir}/bin/elixir" ];
  cmd = [ "--version" ];

  extraPkgs = with pkgs; [ erlang git cacert ];

  labels = {
    "org.opencontainers.image.title" = "Elixir";
    "org.opencontainers.image.description" = "Dynamic, functional language for building scalable applications";
    "org.opencontainers.image.version" = pkgs.elixir.version;
  };
}
