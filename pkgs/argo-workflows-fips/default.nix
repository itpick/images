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
  version = "3.6.4";

  src = fetchFromGitHub {
    owner = "argoproj";
    repo = "argo-workflows";
    rev = "v${version}";
    hash = "sha256-R6njT6Lae+8KiTyXjxE5/U922pP0VqgCIRwGhWBOZUI=";
  };

  commonAttrs = {
    inherit version src;
    # Enable CGO for BoringCrypto
    env.CGO_ENABLED = 1;
    # Enable FIPS mode via BoringCrypto
    env.GOEXPERIMENT = "boringcrypto";
    doCheck = false;
    meta = with lib; {
      description = "Container native workflow engine for Kubernetes (FIPS 140-3 compliant)";
      homepage = "https://argoproj.github.io/argo-workflows/";
      license = licenses.asl20;
    };
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/argoproj/argo-workflows/v3/pkg/version.version=${version}"
    "-X github.com/argoproj/argo-workflows/v3/pkg/version.buildDate=1970-01-01T00:00:00Z"
    "-X github.com/argoproj/argo-workflows/v3/pkg/version.gitCommit=unknown"
    "-X github.com/argoproj/argo-workflows/v3/pkg/version.gitTreeState=clean"
  ];

  # All components share the same vendor hash since they use the same go.mod
  vendorHash = "sha256-uCIdZkoPgppJtrFf7nOVIyEXo1bVILYXNs5LtLLLmsY=";

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
