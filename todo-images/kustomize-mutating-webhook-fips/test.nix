{ pkgs, lib, ... }:

# TODO: Add tests for kustomize-mutating-webhook-fips image
{
  name = "kustomize-mutating-webhook-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kustomize-mutating-webhook-fips"
    exit 1
  '';
}
