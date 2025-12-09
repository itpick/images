{ buildCLIImage, pkgs, lib, ... }:

# Image: openai
# Reference: https://images.chainguard.dev/directory/image/openai/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.13-annotated-types (0.7.0-r4)
#   py3.13-anyio (4.12.0-r0)
#   py3.13-certifi (2025.11.12-r0)
#   py3.13-colorama (0.4.6-r10)
#   py3.13-distro (1.9.0-r6)
#   py3.13-exceptiongroup (1.3.1-r0)
#   py3.13-h11 (0.16.0-r3)
#   py3.13-httpcore (1.0.9-r2)
#   py3.13-httpx (0.28.1-r2)
#   py3.13-idna (3.11-r0)
#   py3.13-jiter (0.12.0-r0)
#   py3.13-openai (2.9.0-r0)
#   py3.13-openai-bin (2.9.0-r0)
#   py3.13-pydantic (2.12.5-r0)
#   py3.13-pydantic-core (2.41.5-r0)
#   py3.13-pygments (2.19.2-r3)
#   py3.13-sniffio (1.3.1-r4)
#   py3.13-tqdm (4.67.1-r3)
#   py3.13-typing-extensions (4.15.0-r0)
#   py3.13-typing-inspection (0.4.2-r0)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement openai image
throw "Image 'openai' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gdbm;
#   name = "openai";
#   tag = "v${pkgs.gdbm.version}";
#   entrypoint = [ "${pkgs.gdbm}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "openai";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
