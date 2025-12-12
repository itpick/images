{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# containerd-shim-runc-v2-fips
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
  name = "containerd-shim-runc-v2-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "containerd-shim-runc-v2-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "containerd shim runc v2 fips";
      "org.opencontainers.image.description" = "containerd-shim-runc-v2-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
