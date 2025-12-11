{ mkImage, pkgs, lib, ... }:

# OpenResty - Nginx with Lua extensions
# https://openresty.org/

mkImage {
  drv = pkgs.openresty;
  name = "openresty";
  tag = "v${pkgs.openresty.version}";
  entrypoint = [ "${pkgs.openresty}/bin/openresty" ];
  cmd = [ "-g" "daemon off;" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenResty";
    "org.opencontainers.image.description" = "Dynamic web platform based on NGINX and LuaJIT";
    "org.opencontainers.image.version" = pkgs.openresty.version;
  };
}
