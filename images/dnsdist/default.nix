{ mkImage, pkgs, lib, ... }:

# dnsdist - DNS load balancer
# https://dnsdist.org/

let
  # dnsdist refuses to start without a config. Bake a minimal default: listen
  # on 0.0.0.0:5300 (>1024 so the nonroot user can bind) and forward to a public
  # resolver. Written to /etc/dnsdist.conf — the package ships /etc/dnsdist.conf-dist
  # (a sample), so this real name is not shadowed. Operators mount their own.
  dnsdistConfig = pkgs.writeTextDir "etc/dnsdist.conf" ''
    setLocal("0.0.0.0:5300")
    addACL("0.0.0.0/0")
    newServer({address="8.8.8.8:53"})
  '';

in
mkImage {
  drv = pkgs.dnsdist;
  name = "dnsdist";
  tag = "v${pkgs.dnsdist.version}";
  entrypoint = [ "${pkgs.dnsdist}/bin/dnsdist" ];
  # Was `--help` (a one-shot). Run in the foreground (--supervised disables the
  # interactive console + best-effort systemd notify) with the baked config.
  cmd = [
    "--supervised"
    "--disable-syslog"
    "-C" "/etc/dnsdist.conf"
  ];

  extraPkgs = [ dnsdistConfig ];

  labels = {
    "org.opencontainers.image.title" = "dnsdist";
    "org.opencontainers.image.description" = "Highly DNS-, DoS- and abuse-aware loadbalancer";
    "org.opencontainers.image.version" = pkgs.dnsdist.version;
    "io.nix-containers.image.upstream" = "https://dnsdist.org/";
    "io.nix-containers.image.category" = "networking";
    "io.nix-containers.image.aliases" = "dnsdist,dns,loadbalancer";
  };
}
