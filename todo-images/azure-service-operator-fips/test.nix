{ pkgs, lib, ... }:

# TODO: Add tests for azure-service-operator-fips image
{
  name = "azure-service-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azure-service-operator-fips"
    exit 1
  '';
}
