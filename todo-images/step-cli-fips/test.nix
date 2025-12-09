{ pkgs, lib, ... }:

# TODO: Add tests for step-cli-fips image
{
  name = "step-cli-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for step-cli-fips"
    exit 1
  '';
}
