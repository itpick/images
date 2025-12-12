{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# just-newuidmap-newgidmap
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
  name = "just-newuidmap-newgidmap";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "just-newuidmap-newgidmap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "just newuidmap newgidmap";
      "org.opencontainers.image.description" = "just-newuidmap-newgidmap container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
