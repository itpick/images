# Argo Workflows FIPS - Container native workflow engine for Kubernetes (FIPS 140-3 compliant)
# https://github.com/argoproj/argo-workflows
#
# This package builds all Argo Workflows components with FIPS 140-3 compliance
# using Google's BoringCrypto module via GOEXPERIMENT=boringcrypto
# - argo: CLI for interacting with Argo Workflows
# - workflow-controller: The main controller that orchestrates workflows
# - argoexec: Executor that runs in workflow pods

{ lib, fetchFromGitHub, buildGoModule, symlinkJoin }:

let
  version = "4.0.6";

  src = fetchFromGitHub {
    owner = "argoproj";
    repo = "argo-workflows";
    rev = "v${version}";
    hash = "sha256-3UTvyOI3T7BvQAPi1Zl+DhUw7Y+TiBVT50Y2CL5eEm0=";
  };

  commonAttrs = {
    inherit version src;
    # Enable CGO for BoringCrypto
    env.CGO_ENABLED = 1;
    # Enable FIPS mode via BoringCrypto
    env.GOEXPERIMENT = "boringcrypto";
    doCheck = false;
    # v4 embeds the web UI (ui/embed.go: //go:embed dist/app); the UI is built
    # separately and is absent from the source tarball. The CLI, controller and
    # executor do not serve the UI, so a placeholder satisfies the embed without
    # needing a JS/yarn build.
    preBuild = ''
      mkdir -p ui/dist/app
      touch ui/dist/app/index.html
    '';
    meta = with lib; {
      description = "Container native workflow engine for Kubernetes (FIPS 140-3 compliant)";
      homepage = "https://argoproj.github.io/argo-workflows/";
      license = licenses.asl20;
    };
  };

  # v4 moved the version vars from /v3/pkg/version to the root /v4 package.
  ldflags = [
    "-s" "-w"
    "-X github.com/argoproj/argo-workflows/v4.version=${version}"
    "-X github.com/argoproj/argo-workflows/v4.buildDate=1970-01-01T00:00:00Z"
    "-X github.com/argoproj/argo-workflows/v4.gitCommit=unknown"
    "-X github.com/argoproj/argo-workflows/v4.gitTreeState=clean"
    "-X github.com/argoproj/argo-workflows/v4.gitTag=v${version}"
  ];

  # All components share the same vendor hash since they use the same go.mod
  vendorHash = "sha256-G9/tUdx37sVXTXjmaZUXIXB+IYqk50OVG/vMHxVeMRU=";

  # CLI
  argo-cli = buildGoModule (commonAttrs // {
    pname = "argo-cli-fips";
    subPackages = [ "cmd/argo" ];
    inherit vendorHash ldflags;
  });

  # Workflow Controller
  workflow-controller = buildGoModule (commonAttrs // {
    pname = "argo-workflow-controller-fips";
    subPackages = [ "cmd/workflow-controller" ];
    inherit vendorHash ldflags;
  });

  # Executor (argoexec)
  argoexec = buildGoModule (commonAttrs // {
    pname = "argoexec-fips";
    subPackages = [ "cmd/argoexec" ];
    inherit vendorHash ldflags;
  });

in symlinkJoin {
  name = "argo-workflows-fips-${version}";
  paths = [ argo-cli workflow-controller argoexec ];
  passthru = {
    inherit version argo-cli workflow-controller argoexec;
    isFips = true;
  };
}
