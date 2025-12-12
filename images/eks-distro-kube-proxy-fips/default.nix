{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eks-distro-kube-proxy-fips
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
  name = "eks-distro-kube-proxy-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "eks-distro-kube-proxy-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "eks distro kuue proxy fips";
      "org.opencontainers.image.description" = "eks-distro-kube-proxy-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
