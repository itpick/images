{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-trivy-adapter
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
  name = "harbor-trivy-adapter";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "harbor-trivy-adapter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "harbor-trivy-adapter";
      "org.opencontainers.image.description" = "harbor-trivy-adapter container image";
    };
  };
}
