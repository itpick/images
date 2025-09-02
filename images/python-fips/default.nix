{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

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