{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# httpd
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "httpd";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "httpd-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "httpd";
      "org.opencontainers.image.description" = "httpd container image";
    };
  };
}
