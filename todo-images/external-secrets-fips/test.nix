{ pkgs, lib, ... }:

# TODO: Add tests for external-secrets-fips image
{
  name = "external-secrets-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for external-secrets-fips"
    exit 1
  '';
}
