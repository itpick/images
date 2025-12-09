{ pkgs, lib, ... }:

# TODO: Add tests for falcoctl-fips image
{
  name = "falcoctl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falcoctl-fips"
    exit 1
  '';
}
