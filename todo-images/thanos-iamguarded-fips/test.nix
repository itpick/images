{ pkgs, lib, ... }:

# TODO: Add tests for thanos-iamguarded-fips image
{
  name = "thanos-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-iamguarded-fips"
    exit 1
  '';
}
