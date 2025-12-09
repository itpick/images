{ buildCLIImage, pkgs, lib, ... }:

# Image: elastic-agent-fips
# Reference: https://images.chainguard.dev/directory/image/elastic-agent-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpcap  # libpcap (1.10.5-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   agentbeat-fips (9.2.2-r2)
#   apm-server-fips-9.1 (9.1.8-r1)
#   cloudbeat-fips-9.1 (9.1.8-r0)
#   elastic-agent-fips-9.1 (9.1.8-r1)
#   fleet-server-fips-9.1 (9.1.8-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   opentelemetry-collector-fips (0.141.0-r1)

# TODO: Implement elastic-agent-fips image
throw "Image 'elastic-agent-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "elastic-agent-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "elastic-agent-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
