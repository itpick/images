{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  grypePackages = with pkgs; [
    grype
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "grype";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "grype-root";
      paths = base.basePackages ++ grypePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath grypePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Vulnerability scanner for container images and filesystems";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.grype.version;
      "io.nix-containers.image.upstream" = "https://github.com/anchore/grype";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "grype,vulnerability,scanner,security";
    };
  };
}