{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  cosignPackages = with pkgs; [
    cosign
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "cosign";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "cosign-root";
      paths = base.basePackages ++ cosignPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cosignPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Container signing tool with support for OCI registry";
    };
  };
}