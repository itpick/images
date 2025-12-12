{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# adoptium-openjdk-bcfips-policy-140-3-j21
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
  name = "adoptium-openjdk-bcfips-policy-140-3-j21";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "adoptium-openjdk-bcfips-policy-140-3-j21-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "adoptium openjdk ucfips policy 140 3 j21";
      "org.opencontainers.image.description" = "adoptium-openjdk-bcfips-policy-140-3-j21 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
