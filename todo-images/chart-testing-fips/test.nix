{ pkgs, lib, ... }:

# TODO: Add tests for chart-testing-fips image
{
  name = "chart-testing-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chart-testing-fips"
    exit 1
  '';
}
