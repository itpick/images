{ pkgs, lib, ... }:

# TODO: Add tests for os-shell-iamguarded-fips image
{
  name = "os-shell-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for os-shell-iamguarded-fips"
    exit 1
  '';
}
