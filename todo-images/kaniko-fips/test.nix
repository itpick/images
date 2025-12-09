{ pkgs, lib, ... }:

# TODO: Add tests for kaniko-fips image
{
  name = "kaniko-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kaniko-fips"
    exit 1
  '';
}
