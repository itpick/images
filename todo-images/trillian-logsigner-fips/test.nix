{ pkgs, lib, ... }:

# TODO: Add tests for trillian-logsigner-fips image
{
  name = "trillian-logsigner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trillian-logsigner-fips"
    exit 1
  '';
}
