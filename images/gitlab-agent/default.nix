{ mkImage, fetchFromGitLab, buildGoModule, lib, ... }:


# Chainguard SBOM packages for gitlab-agent:
# Packages NOT in nixpkgs:
#   gitlab-agent (kas) - Kubernetes Agent Server

let
  version = "18.7.0";
  gitlab-agent = buildGoModule {
    pname = "gitlab-agent";
    inherit version;

    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "cluster-integration/gitlab-agent";
      rev = "v${version}";
      hash = "sha256-2TYqFLc5UxJ7S5dk0rTiT2hko5ZfATn6upZ+DEBgFFk=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/kas" "cmd/agentk" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X gitlab.com/gitlab-org/cluster-integration/gitlab-agent/v2/cmd.Version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "GitLab Agent for Kubernetes - connects Kubernetes clusters to GitLab";
      homepage = "https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent";
      license = licenses.mit;
    };
  };

in
mkImage {
  drv = gitlab-agent;
  name = "gitlab-agent";
  tag = "v${version}";
  entrypoint = [ "${gitlab-agent}/bin/kas" ];
  cmd = [ "--help" ];

  env = {
    LANG = "C.UTF-8";
  };

  labels = {
    "org.opencontainers.image.title" = "GitLab Agent for Kubernetes";
    "org.opencontainers.image.description" = "Connects Kubernetes clusters to GitLab";
    "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
    "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
    "org.opencontainers.image.vendor" = "nix-containers";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.image.upstream" = "https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent";
    "io.nix-containers.image.category" = "devops-tool";
    "io.nix-containers.image.aliases" = "gitlab-agent,kas,kubernetes-agent";
  };
}
