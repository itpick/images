{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eks-distro-kube-apiserver-fips
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
  name = "eks-distro-kube-apiserver-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "eks-distro-kube-apiserver-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "eks distro kuue apiserver fips";
      "org.opencontainers.image.description" = "eks-distro-kube-apiserver-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
