# dduportal-bats
# =============
# Bats (Bash Automated Testing System) image for Helm chart testing
# Used by various Helm charts for test hooks
# https://github.com/bats-core/bats-core

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Chainguard SBOM packages for dduportal-bats:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.bats  # bats-core
#   pkgs.parallel  # parallel (for parallel test execution)

let
  batsPackages = with pkgs; [
    bats         # Bats testing framework
    bash         # Bash shell
    coreutils    # Standard utilities
    gnugrep      # grep for assertions
    gnused       # sed for text manipulation
    gawk         # awk for text processing
    findutils    # find command
    diffutils    # diff for comparisons
    ncurses      # For terminal handling
    parallel     # GNU parallel for parallel execution
    tini         # Init system
    curl         # HTTP testing
    jq           # JSON processing
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "dduportal-bats";
  tag = pkgs.bats.version;

  copyToRoot = [
    (buildEnv {
      name = "dduportal-bats-root";
      paths = base.basePackages ++ batsPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath batsPackages}"
    ];
    Entrypoint = [ "${pkgs.tini}/bin/tini" "--" "${pkgs.bats}/bin/bats" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "Bats";
      "org.opencontainers.image.description" = "Bash Automated Testing System for Helm chart testing";
      "org.opencontainers.image.version" = pkgs.bats.version;
    };
  };
}
