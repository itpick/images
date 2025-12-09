{ pkgs, lib, ... }:

# TODO: Add tests for terraform-fips image
{
  name = "terraform-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for terraform-fips"
    exit 1
  '';
}
