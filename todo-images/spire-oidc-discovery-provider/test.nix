{ pkgs, lib, ... }:

# TODO: Add tests for spire-oidc-discovery-provider image
{
  name = "spire-oidc-discovery-provider";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spire-oidc-discovery-provider"
    exit 1
  '';
}
