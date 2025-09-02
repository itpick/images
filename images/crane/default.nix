{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  cranePackages = with pkgs; [
    crane
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "crane";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "crane-root";
      paths = base.basePackages ++ cranePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cranePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Tool for interacting with remote images and registries";
      "org.opencontainers.image.version" = pkgs.crane.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://github.com/google/go-containerregistry";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "crane,registry,oci,container";
    };
  };
}