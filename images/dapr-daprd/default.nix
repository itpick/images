{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dapr-daprd
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
  name = "dapr-daprd";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dapr-daprd-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dapr daprd";
      "org.opencontainers.image.description" = "dapr-daprd container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
