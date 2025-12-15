{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for bats:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.parallel  # parallel (20251122-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   bats-assert (2.2.4-r0)
#   bats-core (1.13.0-r0)
#   bats-core-full (1.13.0-r0)
#   bats-detik (1.4.0-r0)
#   bats-file (0.4.0-r0)
#   bats-support (0.3.0-r0)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

let
  packages = with pkgs; [
    bats
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "bats";
  tag = "v${pkgs.bats.version}";

  copyToRoot = [
    (buildEnv {
      name = "bats-root";
      paths = base.basePackages ++ packages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath packages}"
    ];
    Entrypoint = [ "${pkgs.bats}/bin/bats" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Bash Automated Testing System";
      "org.opencontainers.image.version" = pkgs.bats.version;
      "io.nix-containers.chart" = "kube-prometheus-stack,kyverno";
    };
  };
}
