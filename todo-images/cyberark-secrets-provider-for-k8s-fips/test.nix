{ pkgs, lib, ... }:

# TODO: Add tests for cyberark-secrets-provider-for-k8s-fips image
{
  name = "cyberark-secrets-provider-for-k8s-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cyberark-secrets-provider-for-k8s-fips"
    exit 1
  '';
}
