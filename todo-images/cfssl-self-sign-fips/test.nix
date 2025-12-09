{ pkgs, lib, ... }:

# TODO: Add tests for cfssl-self-sign-fips image
{
  name = "cfssl-self-sign-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cfssl-self-sign-fips"
    exit 1
  '';
}
