{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for rust:
# Packages available in nixpkgs:
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cargo-auditable  # cargo-auditable (0.7.2-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libllvm  # libllvm-21 (21.1.7-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.fzf-make  # make (4.4.1-r8)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.pkgconf  # pkgconf (2.5.1-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.rust  # rust-1.91 (1.91.1-r0)
#   pkgs.rust-audit-info  # rust-audit-info (0.5.4-r3)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   build-base (1-r9)
#   glibc-dev (2.42-r4)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libatomic (15.2.0-r6)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libgomp (15.2.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)
#   ... and 8 more

let
  rustPackages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    git
    bash
    coreutils
    findutils
    which
    gcc
    gnumake
    pkg-config
    openssl
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "rust";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "rust-root";
      paths = base.basePackages ++ rustPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath rustPackages}"
      "CARGO_HOME=/home/nonroot/.cargo"
      "RUSTUP_HOME=/home/nonroot/.rustup"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Rust programming language and development tools";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.rustc.version;
      "io.nix-containers.image.upstream" = "https://www.rust-lang.org/";
      "io.nix-containers.image.category" = "build-env";
      "io.nix-containers.image.aliases" = "rust,rustc,cargo";
    };
  };
}