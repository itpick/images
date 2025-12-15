{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for nginx:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   nginx-mainline-config (1.29.3-r0)
#   nginx-mainline-package-config (1.29.3-r0)

let
  # nginx packages
  nginxPackages = with pkgs; [
    nginx
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nginx";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "nginx-root";
      paths = base.basePackages ++ nginxPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath nginxPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "High-performance HTTP server and reverse proxy";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.nginx.version;
      "io.nix-containers.image.upstream" = "https://nginx.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "nginx,webserver,proxy";
    };
  };
}
