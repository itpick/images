{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# render-template
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
  name = "render-template";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "render-template-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "render template";
      "org.opencontainers.image.description" = "render-template container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
