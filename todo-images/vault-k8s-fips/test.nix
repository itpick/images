{ pkgs, lib, ... }:

# TODO: Add tests for vault-k8s-fips image
{
  name = "vault-k8s-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vault-k8s-fips"
    exit 1
  '';
}
