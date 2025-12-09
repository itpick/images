{ pkgs, lib, ... }:

# TODO: Add tests for tflint-fips image
{
  name = "tflint-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tflint-fips"
    exit 1
  '';
}
