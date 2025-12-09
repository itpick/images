{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-tsa-createcertchain-fips image
{
  name = "sigstore-scaffolding-tsa-createcertchain-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-tsa-createcertchain-fips"
    exit 1
  '';
}
