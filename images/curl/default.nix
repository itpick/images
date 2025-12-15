{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for curl:
# Packages available in nixpkgs:
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.rustls-ffi  # rustls-ffi (0.15.0-r3)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcurl-rustls4 (8.17.0-r0)
#   ncurses-terminfo (6.5_p20251025-r1)

let
  # curl packages
  curlPackages = with pkgs; [
    curl
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "curl";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "curl-root";
      paths = base.basePackages ++ curlPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath curlPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Command-line tool for transferring data with URLs";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.curl.version;
      "io.nix-containers.image.upstream" = "https://curl.se/";
      "io.nix-containers.image.category" = "utility";
      "io.nix-containers.image.aliases" = "curl,http-client";
    };
  };
}
