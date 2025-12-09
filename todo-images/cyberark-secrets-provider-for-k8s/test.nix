{ pkgs, lib, ... }:

# TODO: Add tests for cyberark-secrets-provider-for-k8s image
{
  name = "cyberark-secrets-provider-for-k8s";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cyberark-secrets-provider-for-k8s"
    exit 1
  '';
}
