{ pkgs, lib, ... }:

# TODO: Add tests for metrics-server-iamguarded-fips image
{
  name = "metrics-server-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metrics-server-iamguarded-fips"
    exit 1
  '';
}
