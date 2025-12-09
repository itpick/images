{ pkgs, lib, ... }:

# TODO: Add tests for falco-no-driver-fips image
{
  name = "falco-no-driver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falco-no-driver-fips"
    exit 1
  '';
}
