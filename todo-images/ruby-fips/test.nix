{ pkgs, lib, ... }:

# TODO: Add tests for ruby-fips image
{
  name = "ruby-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ruby-fips"
    exit 1
  '';
}
