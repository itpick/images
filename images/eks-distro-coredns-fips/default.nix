{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# eks-distro-coredns-fips
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
  name = "eks-distro-coredns-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "eks-distro-coredns-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "eks distro coredns fips";
      "org.opencontainers.image.description" = "eks-distro-coredns-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
