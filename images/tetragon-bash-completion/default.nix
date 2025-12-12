{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tetragon-bash-completion
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "tetragon-bash-completion";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tetragon-bash-completion-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tetragon uash completion";
      "org.opencontainers.image.description" = "tetragon-bash-completion container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
