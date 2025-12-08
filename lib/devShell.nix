# Development shell configuration for container images
{ lib, pkgs, ... }:

rec {
  # Basic development tools
  basicDevTools = with pkgs; [
    bash
    coreutils
    findutils
    gnused
    gnugrep
    gawk
    which
    curl
    wget
    git
    vim
    nano
  ];
  
  # Extended development tools
  extendedDevTools = with pkgs; [
    jq
    yq
    tree
    htop
    procps
    psmisc
    iproute2
    iputils
    nettools
    openssh
    gnupg
    unzip
    zip
    gnutar
    gzip
  ];
  
  # Programming language tools
  programmingTools = with pkgs; [
    python3
    nodejs
    go
    rustc
    cargo
    gcc
    make
    cmake
    pkg-config
  ];
  
  # Container debugging tools
  containerTools = with pkgs; [
    dive
    skopeo
    crane
    kubernetes-helm
    kubectl
  ];
  
  # Default dev shell environment
  defaultDevEnv = [
    "SHELL=${pkgs.bash}/bin/bash"
    "TERM=xterm"
    "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  ];
  
  # Minimal dev shell (just bash and basic tools)
  minimalDevShell = {
    packages = basicDevTools;
    env = defaultDevEnv;
    config = {
      Cmd = [ "${pkgs.bash}/bin/bash" ];
      Env = defaultDevEnv;
    };
  };
  
  # Standard dev shell (bash + extended tools)
  standardDevShell = {
    packages = basicDevTools ++ extendedDevTools;
    env = defaultDevEnv;
    config = {
      Cmd = [ "${pkgs.bash}/bin/bash" ];
      Env = defaultDevEnv;
    };
  };
  
  # Full dev shell (all tools)
  fullDevShell = {
    packages = basicDevTools ++ extendedDevTools ++ programmingTools ++ containerTools;
    env = defaultDevEnv;
    config = {
      Cmd = [ "${pkgs.bash}/bin/bash" ];
      Env = defaultDevEnv;
    };
  };
  
  # Function to create custom dev shell
  mkDevShell = { 
    extraPackages ? [], 
    extraEnv ? [], 
    shell ? "${pkgs.bash}/bin/bash",
    includeBasic ? true,
    includeExtended ? false,
    includeProgramming ? false,
    includeContainer ? false
  }:
    let
      packages = extraPackages 
        ++ (if includeBasic then basicDevTools else [])
        ++ (if includeExtended then extendedDevTools else [])
        ++ (if includeProgramming then programmingTools else [])
        ++ (if includeContainer then containerTools else []);
      env = defaultDevEnv ++ extraEnv;
    in {
      inherit packages env;
      config = {
        Cmd = [ shell ];
        Env = env;
      };
    };
}