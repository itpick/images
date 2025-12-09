{ pkgs, lib, ... }:

# TODO: Add tests for rails-fips image
{
  name = "rails-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rails-fips"
    exit 1
  '';
}
