{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# modelmesh-runtime-adapter
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
  name = "modelmesh-runtime-adapter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "modelmesh-runtime-adapter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "modelmesh runtime adapter";
      "org.opencontainers.image.description" = "modelmesh-runtime-adapter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
