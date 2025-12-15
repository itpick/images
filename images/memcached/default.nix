{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for memcached:
# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.memcached  # memcached (1.6.39-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
# Packages NOT in nixpkgs:
#   heimdal-libs (7.8.0-r42)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sqlite-libs (3.51.1-r0)

let
  packages = with pkgs; [
    memcached
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "memcached";
  tag = pkgs.memcached.version;

  copyToRoot = [
    (buildEnv {
      name = "memcached-root";
      paths = base.basePackages ++ packages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath packages}"
    ];
    ExposedPorts = {
      "11211/tcp" = {};
    };
    Entrypoint = [ "${pkgs.memcached}/bin/memcached" ];
    Cmd = [ "-u" "nobody" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "High performance distributed memory object caching system";
      "org.opencontainers.image.version" = pkgs.memcached.version;
      "io.nix-containers.chart" = "loki";
    };
  };
}
