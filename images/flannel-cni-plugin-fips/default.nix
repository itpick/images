{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# flannel-cni-plugin-fips
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
  name = "flannel-cni-plugin-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "flannel-cni-plugin-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "flannel cni plugin fips";
      "org.opencontainers.image.description" = "flannel-cni-plugin-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
