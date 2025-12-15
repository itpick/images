{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for go:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.go  # go-1.25 (1.25.5-r0)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.fzf-make  # make (4.4.1-r8)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.pkgconf  # pkgconf (2.5.1-r1)
#   pkgs.readline  # readline (8.3-r1)
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
#   libexpat1 (2.7.3-r0)
#   libgomp (15.2.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   ... and 11 more

let
  goPackages = with pkgs; [
    go
    git
    bash
    coreutils
    findutils
    which
    gcc
    gnumake
  ];

in
nix2container.buildImage {
  name = "go";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "go-root";
      paths = base.basePackages ++ goPackages;
    })
  ];

  # Chainguard runs go as root
  config = nonRoot.rootConfig // {
    Env = base.defaultEnv ++ nonRoot.rootEnv ++ [
      "PATH=${lib.makeBinPath goPackages}"
      "GOPATH=/root/go"
      "GOCACHE=/root/.cache/go-build"
      "GOMODCACHE=/root/go/pkg/mod"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Go programming language with build tools";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.go.version;
      "io.nix-containers.image.upstream" = "https://golang.org/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "go,golang";
    };
  };
}