{ pkgs, lib, ... }:

# TODO: Add tests for pytorch-fips image
{
  name = "pytorch-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pytorch-fips"
    exit 1
  '';
}
