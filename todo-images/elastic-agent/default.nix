{ buildCLIImage, pkgs, lib, ... }:

# Image: elastic-agent
# Reference: https://images.chainguard.dev/directory/image/elastic-agent/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpcap  # libpcap (1.10.5-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.opentelemetry-collector  # opentelemetry-collector (0.141.0-r1)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   agentbeat (9.2.2-r2)
#   apm-server-9.1 (9.1.8-r0)
#   cloudbeat-9.1 (9.1.8-r1)
#   elastic-agent-9.1 (9.1.8-r1)
#   fleet-server-9.1 (9.1.8-r1)
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement elastic-agent image
throw "Image 'elastic-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "elastic-agent";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "elastic-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
