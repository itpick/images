{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# secrets-store-csi-driver-provider-gcp
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
  name = "secrets-store-csi-driver-provider-gcp";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "secrets-store-csi-driver-provider-gcp-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "secrets store csi driver provider gcp";
      "org.opencontainers.image.description" = "secrets-store-csi-driver-provider-gcp container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
