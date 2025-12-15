{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for bash:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sqlite-libs (3.51.1-r0)

let
  # Bash packages
  bashPackages = with pkgs; [
    bash
    coreutils
  ];

in
nix2container.buildImage {
  name = "bash";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "bash-root";
      paths = base.basePackages ++ bashPackages;
    })
  ];

  # Chainguard runs bash as root
  config = nonRoot.rootConfig // {
    Cmd = [ "${pkgs.bash}/bin/bash" ];
    Env = base.defaultEnv ++ nonRoot.rootEnv ++ [
      "PATH=${lib.makeBinPath bashPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "GNU Bash shell with core utilities";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.bash.version;
      "io.nix-containers.image.upstream" = "https://www.gnu.org/software/bash/";
      "io.nix-containers.image.category" = "shell";
      "io.nix-containers.image.aliases" = "bash,sh";
    };
  };
}
