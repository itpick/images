{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for ruby:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ruby  # ruby-3.4 (3.4.7-r2)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libjemalloc2 (5.3.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

let
  rubyPackages = with pkgs; [
    ruby_3_3
    # bundler is already included in ruby_3_3
    git
    bash
    coreutils
    findutils
    which
    gcc
    gnumake
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "ruby";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "ruby-root";
      paths = base.basePackages ++ rubyPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath rubyPackages}"
      "GEM_HOME=/home/nonroot/.gem"
      "BUNDLE_PATH=/home/nonroot/.bundle"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Ruby programming language";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.ruby.version;
      "io.nix-containers.image.upstream" = "https://www.ruby-lang.org/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "ruby,rails,gem";
    };
  };
}