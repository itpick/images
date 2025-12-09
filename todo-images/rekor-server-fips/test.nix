{ pkgs, lib, ... }:

# TODO: Add tests for rekor-server-fips image
{
  name = "rekor-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rekor-server-fips"
    exit 1
  '';
}
