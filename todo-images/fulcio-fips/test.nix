{ pkgs, lib, ... }:

# TODO: Add tests for fulcio-fips image
{
  name = "fulcio-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fulcio-fips"
    exit 1
  '';
}
