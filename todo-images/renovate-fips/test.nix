{ pkgs, lib, ... }:

# TODO: Add tests for renovate-fips image
{
  name = "renovate-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for renovate-fips"
    exit 1
  '';
}
