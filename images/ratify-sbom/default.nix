{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ratify-sbom
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
  name = "ratify-sbom";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ratify-sbom-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ratify suom";
      "org.opencontainers.image.description" = "ratify-sbom container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
