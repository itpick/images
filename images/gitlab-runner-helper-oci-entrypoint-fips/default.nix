{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab runner helper oci entrypoint-fips
# GitLab component: runner-helper-oci-entrypoint

let
  componentPkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "gitlab-runner-helper-oci-entrypoint-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-runner-helper-oci-entrypoint-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab runner helper oci entrypoint";
      "org.opencontainers.image.description" = "GitLab runner-helper-oci-entrypoint component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
