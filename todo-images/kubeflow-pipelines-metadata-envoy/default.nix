{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-pipelines-metadata-envoy
# Reference: https://images.chainguard.dev/directory/image/kubeflow-pipelines-metadata-envoy/overview

# Packages available in nixpkgs:
#   pkgs.envoy  # envoy-1.36 (1.36.3-r0)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   glibc-iconv (2.42-r4)
#   kubeflow-pipelines-metadata-envoy-config (2.15.0-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libgomp (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement kubeflow-pipelines-metadata-envoy image
throw "Image 'kubeflow-pipelines-metadata-envoy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.envoy;
#   name = "kubeflow-pipelines-metadata-envoy";
#   tag = "v${pkgs.envoy.version}";
#   entrypoint = [ "${pkgs.envoy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-pipelines-metadata-envoy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
