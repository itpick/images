{ pkgs, lib, ... }:

# TODO: Add tests for kustomize-mutating-webhook image
{
  name = "kustomize-mutating-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kustomize-mutating-webhook"
    exit 1
  '';
}
