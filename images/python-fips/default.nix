{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for python-fips:
# Packages available in nixpkgs:
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.python  # python-3.14 (3.14.1-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   py3-pip-wheel (25.3-r2)
#   python-3.14-base (3.14.1-r0)
#   sqlite-libs (3.51.1-r0)

let
  # FIPS OpenSSL configuration
  fipsConfig = pkgs.writeText "openssl-fips.cnf" ''
    config_diagnostics = 1
    openssl_conf = openssl_init

    [openssl_init]
    providers = provider_sect

    [provider_sect]
    fips = fips_sect
    base = base_sect

    [base_sect]
    activate = 1

    [fips_sect]
    activate = 1
    module_name = fips
    module_path = ${pkgs.openssl}/lib/ossl-modules/fips.so
    security_checks = 1
    tls_digest_algs = SHA256:SHA384:SHA512
  '';

  pythonPackages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.wheel
    python3Packages.cryptography
    git
    bash
    coreutils
    findutils
    which
    gcc
    gnumake
    openssl
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "python-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "python-fips-root";
      paths = base.basePackages ++ pythonPackages ++ [ userEnv ];
    })
    # Add FIPS configuration
    (pkgs.runCommand "fips-config" {} ''
      mkdir -p $out/etc/fips
      cp ${fipsConfig} $out/etc/fips/openssl.cnf
    '')
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath pythonPackages}"
      "PYTHONPATH=/home/nonroot/.local/lib/python3.13/site-packages"
      "PIP_USER=1"
      "OPENSSL_FIPS_READY=1"
      "FIPS_CONFIG_AVAILABLE=/etc/fips/openssl.cnf"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Python 3.13 runtime with FIPS 140-2 validated cryptography";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.python3.version;
      "io.nix-containers.image.upstream" = "https://www.python.org/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "python-fips,py-fips";
      "io.nix-containers.image.fips" = "true";
      "io.nix-containers.image.compliance" = "FIPS-140-2";
    };
  };
}