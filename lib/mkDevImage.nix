# Development Image Builder
# =========================
# Creates a -dev variant of any image by adding a devshell layer with
# common development tools (bash, git, curl, vim, etc.)
#
# Usage:
#   let mkDevImage = pkgs.callPackage ./lib/mkDevImage.nix { ... };
#   in mkDevImage { baseImage = myImage; }

{ nix2container, pkgs, lib, devShell, buildEnv, ... }:

{ baseImage
, devLevel ? "standard"  # "minimal", "standard", or "full"
, extraDevPackages ? []
}:

let
  # Get dev packages based on level
  devPackages =
    if devLevel == "minimal" then devShell.basicDevTools
    else if devLevel == "full" then devShell.basicDevTools ++ devShell.extendedDevTools ++ devShell.programmingTools
    else devShell.basicDevTools ++ devShell.extendedDevTools;  # standard

  allDevPackages = devPackages ++ extraDevPackages;

  # Build environment with dev tools
  devEnv = buildEnv {
    name = "${baseImage.imageName or "image"}-dev-env";
    paths = allDevPackages;
    pathsToLink = [ "/bin" "/share" "/etc" "/lib" ];
  };

  # Create dev layer
  devLayer = nix2container.buildLayer {
    copyToRoot = [ devEnv ];
  };

  # Get the original layers from base image
  baseLayers = baseImage.layers or [];

  # Get base image config
  baseConfig = baseImage.config or {};
  baseEnv = baseConfig.Env or [];
  baseLabels = baseConfig.Labels or {};

  # Dev-specific environment additions
  devEnvAdditions = [
    "SHELL=${pkgs.bash}/bin/bash"
    "TERM=xterm-256color"
    "EDITOR=vim"
  ];

  # Ensure PATH includes dev tools
  devPath = "PATH=${devEnv}/bin:${pkgs.coreutils}/bin:/usr/local/bin:/usr/bin:/bin";

in
nix2container.buildImage {
  name = baseImage.imageName or "image";
  tag = "${baseImage.imageTag or "latest"}-dev";

  # Add dev layer on top of existing layers
  layers = baseLayers ++ [ devLayer ];

  config = baseConfig // {
    # Merge environment variables
    Env = baseEnv ++ devEnvAdditions ++ [ devPath ];

    # Update labels
    Labels = baseLabels // {
      "io.nix-containers.image.variant" = "dev";
      "io.nix-containers.image.dev-level" = devLevel;
    };

    # Default to bash for dev images
    Cmd = [ "${pkgs.bash}/bin/bash" ];
  };
}
