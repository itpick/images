{ pkgs, lib, ... }:

# TODO: Add tests for php-fips image
{
  name = "php-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for php-fips"
    exit 1
  '';
}
