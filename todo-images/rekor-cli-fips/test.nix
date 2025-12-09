{ pkgs, lib, ... }:

# TODO: Add tests for rekor-cli-fips image
{
  name = "rekor-cli-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rekor-cli-fips"
    exit 1
  '';
}
