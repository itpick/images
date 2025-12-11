# cloudflared
# =============
# Cloudflared - Cloudflare Tunnel client
# https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/
#
# Cloudflared creates secure tunnels between your origin servers
# and Cloudflare's edge network.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.cloudflared;
  name = "cloudflared";
  tag = "v${pkgs.cloudflared.version}";
  entrypoint = [ "${pkgs.cloudflared}/bin/cloudflared" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Cloudflared";
    "org.opencontainers.image.description" = "Cloudflare Tunnel client for secure connections";
    "org.opencontainers.image.version" = pkgs.cloudflared.version;
  };
}
