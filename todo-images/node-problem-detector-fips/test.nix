{ pkgs, lib, ... }:

# TODO: Add tests for node-problem-detector-fips image
{
  name = "node-problem-detector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for node-problem-detector-fips"
    exit 1
  '';
}
