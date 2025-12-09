{ pkgs, lib, ... }:

# TODO: Add tests for thanos-operator-fips image
{
  name = "thanos-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-operator-fips"
    exit 1
  '';
}
