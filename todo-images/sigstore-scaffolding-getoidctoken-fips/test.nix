{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-getoidctoken-fips image
{
  name = "sigstore-scaffolding-getoidctoken-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-getoidctoken-fips"
    exit 1
  '';
}
