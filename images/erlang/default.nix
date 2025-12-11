{ mkImage, pkgs, lib, ... }:

# Erlang/OTP - Programming language
# https://www.erlang.org/

mkImage {
  drv = pkgs.erlang;
  name = "erlang";
  tag = "v${pkgs.erlang.version}";
  entrypoint = [ "${pkgs.erlang}/bin/erl" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Erlang/OTP";
    "org.opencontainers.image.description" = "Erlang/OTP programming language and runtime";
    "org.opencontainers.image.version" = pkgs.erlang.version;
  };
}
