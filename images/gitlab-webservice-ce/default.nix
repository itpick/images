{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab webservice ce
# GitLab component: webservice-ce

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
  name = "gitlab-webservice-ce";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-webservice-ce-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab weuservice ce";
      "org.opencontainers.image.description" = "GitLab webservice-ce component";
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
