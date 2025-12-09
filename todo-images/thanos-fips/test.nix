{ pkgs, lib, ... }:

# TODO: Add tests for thanos-fips image
{
  name = "thanos-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-fips"
    exit 1
  '';
}
