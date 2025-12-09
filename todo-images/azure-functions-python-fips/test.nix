{ pkgs, lib, ... }:

# TODO: Add tests for azure-functions-python-fips image
{
  name = "azure-functions-python-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azure-functions-python-fips"
    exit 1
  '';
}
