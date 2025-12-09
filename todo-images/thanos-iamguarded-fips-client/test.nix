{ pkgs, lib, ... }:

# TODO: Add tests for thanos-iamguarded-fips-client image
{
  name = "thanos-iamguarded-fips-client";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-iamguarded-fips-client"
    exit 1
  '';
}
