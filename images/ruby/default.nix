{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  rubyPackages = with pkgs; [
    ruby_3_3
    bundler
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