{ pkgs, lib, ... }:

# TODO: Add tests for falco-fips image
{
  name = "falco-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falco-fips"
    exit 1
  '';
}
