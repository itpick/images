{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # Bash packages
  bashPackages = with pkgs; [
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "bash";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "bash-root";
      paths = base.basePackages ++ bashPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Cmd = [ "${pkgs.bash}/bin/bash" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath bashPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "GNU Bash shell with core utilities";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.bash.version;
      "io.nix-containers.image.upstream" = "https://www.gnu.org/software/bash/";
      "io.nix-containers.image.category" = "shell";
      "io.nix-containers.image.aliases" = "bash,sh";
    };
  };
}
