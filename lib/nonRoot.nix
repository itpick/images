# Non-root user configuration for container images
{ lib, ... }:

rec {
  # Standard non-root user configuration (Chainguard default)
  user = {
    uid = 65532;
    gid = 65532;
    name = "nonroot";
  };

  # User string for container config
  userString = "65532:65532";

  # Standard environment variables for non-root user
  userEnv = [
    "HOME=/home/nonroot"
    "USER=nonroot"
  ];

  # Default container config for non-root users (without Cmd - needs to be added per image)
  defaultConfig = {
    User = userString;
    WorkingDir = "/workspace";
  };

  # Root user configuration (for images that must run as root)
  rootConfig = {
    User = "0:0";
    WorkingDir = "/";
  };

  rootEnv = [
    "HOME=/root"
    "USER=root"
  ];

  # Custom user configuration helper
  mkUserConfig = uid: gid: {
    User = "${toString uid}:${toString gid}";
    WorkingDir = "/workspace";
  };

  mkUserEnvVars = uid: name: home: [
    "HOME=${home}"
    "USER=${name}"
  ];

  # Common user configurations matching Chainguard
  users = {
    # Standard nonroot (65532)
    nonroot = { uid = 65532; gid = 65532; name = "nonroot"; home = "/home/nonroot"; };
    # Nobody (65534)
    nobody = { uid = 65534; gid = 65534; name = "nobody"; home = "/nonexistent"; };
    # Git user (1000) - used by many services
    git = { uid = 1000; gid = 1000; name = "git"; home = "/home/git"; };
    # Runner user (1001)
    runner = { uid = 1001; gid = 1001; name = "runner"; home = "/home/runner"; };
    # ArgoCD user (999)
    argocd = { uid = 999; gid = 999; name = "argocd"; home = "/home/argocd"; };
    # Harbor user (10000)
    harbor = { uid = 10000; gid = 10000; name = "harbor"; home = "/home/harbor"; };
    # Loki user (10001)
    loki = { uid = 10001; gid = 10001; name = "loki"; home = "/home/loki"; };
    # GitLab runner (100)
    gitlab-runner = { uid = 100; gid = 100; name = "gitlab-runner"; home = "/home/gitlab-runner"; };
  };

  # Function to create default user environment
  mkDefaultUserEnv = pkgs: extraDirs:
    pkgs.callPackage ./mkUserEnvironment.nix {} {
      inherit user;
      extraDirs = [ "/workspace" ] ++ (if extraDirs == null then [] else extraDirs);
    };

  # Function to create custom user environment
  mkCustomUserEnv = pkgs: customUser: extraDirs:
    pkgs.callPackage ./mkUserEnvironment.nix {} {
      user = customUser;
      extraDirs = [ "/workspace" ] ++ (if extraDirs == null then [] else extraDirs);
    };
}