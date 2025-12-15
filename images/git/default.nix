{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for git:
# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.git-lfs  # git-lfs (3.7.1-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gpg-tui  # gpg (2.4.8-r3)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libksba  # libksba (1.6.7-r2)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.npth  # npth (1.8-r9)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   dash-binsh (0.5.13-r2)
#   gnupg-gpgconf (2.4.8-r3)
#   gpgsm (2.4.8-r3)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   ... and 3 more

let
  gitPackages = with pkgs; [
    git
    openssh
    gnupg
    bash
    coreutils
    findutils
    gawk
    gnused
    gnugrep
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "git";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "git-root";
      paths = base.basePackages ++ gitPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath gitPackages}"
      "GIT_SSL_CAINFO=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Git version control system with SSH and GPG support";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.git.version;
      "io.nix-containers.image.upstream" = "https://git-scm.com/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "git,vcs";
    };
  };
}