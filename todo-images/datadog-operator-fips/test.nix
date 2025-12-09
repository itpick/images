{ pkgs, lib, ... }:

# TODO: Add tests for datadog-operator-fips image
{
  name = "datadog-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for datadog-operator-fips"
    exit 1
  '';
}
