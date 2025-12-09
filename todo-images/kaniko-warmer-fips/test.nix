{ pkgs, lib, ... }:

# TODO: Add tests for kaniko-warmer-fips image
{
  name = "kaniko-warmer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kaniko-warmer-fips"
    exit 1
  '';
}
