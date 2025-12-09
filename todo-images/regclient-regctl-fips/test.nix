{ pkgs, lib, ... }:

# TODO: Add tests for regclient-regctl-fips image
{
  name = "regclient-regctl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for regclient-regctl-fips"
    exit 1
  '';
}
