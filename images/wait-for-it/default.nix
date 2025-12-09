{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for wait-for-it:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   wait-for-it (0.20200823-r7)

let
  waitForItPackages = with pkgs; [
    wait4x
    bash
    coreutils
    netcat-gnu
    curl
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "wait-for-it";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "wait-for-it-root";
      paths = base.basePackages ++ waitForItPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath waitForItPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Wait for service dependencies before starting";
      "org.opencontainers.image.version" = "1.0.0";
    };
  };
}