{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argo-workflowcontroller-fips
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "argo-workflowcontroller-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "argo-workflowcontroller-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "argo-workflowcontroller-fips";
      "org.opencontainers.image.description" = "argo-workflowcontroller-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
