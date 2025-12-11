{ mkImage, pkgs, lib, ... }:

# dnsdist - DNS load balancer
# https://dnsdist.org/

mkImage {
  drv = pkgs.dnsdist;
  name = "dnsdist";
  tag = "v${pkgs.dnsdist.version}";
  entrypoint = [ "${pkgs.dnsdist}/bin/dnsdist" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dnsdist";
    "org.opencontainers.image.description" = "Highly DNS-, DoS- and abuse-aware loadbalancer";
    "org.opencontainers.image.version" = pkgs.dnsdist.version;
  };
}
