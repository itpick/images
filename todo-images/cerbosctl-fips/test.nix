{ pkgs, lib, ... }:

# TODO: Add tests for cerbosctl-fips image
{
  name = "cerbosctl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cerbosctl-fips"
    exit 1
  '';
}
