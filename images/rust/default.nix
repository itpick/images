{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

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
      "org.opencontainers.image.description" = "Rust programming language";
    };
  };
}