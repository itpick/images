{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# aspnet-10-runtime
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
  name = "aspnet-10-runtime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "aspnet-10-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "aspnet 10 runtime";
      "org.opencontainers.image.description" = "aspnet-10-runtime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
